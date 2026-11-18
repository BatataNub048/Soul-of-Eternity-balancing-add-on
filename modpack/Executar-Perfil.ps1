#requires -Version 5.1
[CmdletBinding()]
param(
    [ValidateSet('TodosRecuperados-Titanico-Desempenho')][string]$Perfil = 'TodosRecuperados-Titanico-Desempenho',
    [ValidateSet('Preparar','Verificar','Cliente')][string]$Modo = 'Preparar',
    [string]$PastaTml = ''
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
Import-Module (Join-Path $PSScriptRoot 'lib\Pack.psm1') -Force
Import-Module (Join-Path $PSScriptRoot 'lib\WorldSafety.psm1') -Force
$manifest = Read-PackJson (Join-Path $PSScriptRoot ('profiles\' + $Perfil + '.lock.json'))
$target = [version]$manifest.targetTml
$selected = @(Get-PackSelection $manifest 5 @())
if ($selected.Count -ne 71) { throw 'O perfil de desempenho exige os 71 mods auditados.' }
$profileRoot = Get-PackPath $PSScriptRoot ('saves\' + $Perfil)

function Test-ProfileFiles([string]$Root) {
    $enabled = @(Read-PackJson (Get-PackPath $Root 'Mods\enabled.json'))
    $modFiles = @(Get-ChildItem -LiteralPath (Get-PackPath $Root 'Mods') -File -Filter '*.tmod')
    if (@(Compare-Object ($selected.name | Sort-Object) ($enabled | Sort-Object)).Count -or
        @(Compare-Object ($selected.name | Sort-Object) @($modFiles.BaseName | Sort-Object)).Count) {
        throw 'A pasta Mods ou a lista de mods ativos diverge do perfil auditado.'
    }

    $infos = foreach ($mod in $selected) {
        Test-PackMod (Get-PackPath $Root ('Mods\' + $mod.name + '.tmod')) $mod $target
    }
    Test-PackDependencies @($infos) $selected
    $titanConfig = Read-PackJson (Get-PackPath $Root 'ModConfigs\TitanWorlds_TitanWorldServerConfig.json')
    if ($titanConfig.ForceTitanWorldOnDedicatedServer -ne $true) {
        throw 'A configuracao TitanWorlds exige ForceTitanWorldOnDedicatedServer=true.'
    }
    Assert-PackWorldSafety $Root $true
}

$prepared = $false
$session = $null
$sessionLocked = $false
try {
    if ($Modo -eq 'Cliente') {
        $session = [Threading.Mutex]::new($false, 'Local\TerrariaRev8-LocalSession')
        try { $sessionLocked = $session.WaitOne(0) }
        catch [Threading.AbandonedMutexException] { $sessionLocked = $true }
        if (-not $sessionLocked) { throw 'Ja existe uma sessao de tModLoader iniciada pelo modpack.' }

        Assert-PackGameClosed
        $tml = Get-PackTml $PastaTml
        if ($tml.Version -ne $target) {
            throw "Este perfil usa tModLoader $target. Versao encontrada: $($tml.Version)."
        }
        $runtime = Join-Path $tml.Path 'dotnet\dotnet.exe'
        if (-not (Test-Path -LiteralPath $runtime -PathType Leaf)) {
            throw 'Runtime do tModLoader nao encontrado na instalacao auditada.'
        }
    }

    if (-not (Test-Path -LiteralPath $profileRoot)) {
        if ($Modo -eq 'Verificar') { throw 'Execute Preparar-Desempenho.ps1 primeiro.' }

        $preparation = [Threading.Mutex]::new($false, 'Local\TerrariaRev8-ProfilePreparation')
        $preparationLocked = $false
        try {
            try { $preparationLocked = $preparation.WaitOne([TimeSpan]::FromMinutes(2)) }
            catch [Threading.AbandonedMutexException] { $preparationLocked = $true }
            if (-not $preparationLocked) { throw 'Outra preparacao do perfil ainda esta em andamento.' }
            if (-not (Test-Path -LiteralPath $profileRoot)) {
                $stage = Get-PackPath $PSScriptRoot ('saves\' + $Perfil + '.preparando-' + [guid]::NewGuid().ToString('N'))
                foreach ($directory in @('Mods','ModConfigs','Worlds','Players')) {
                    New-Item -ItemType Directory -Path (Get-PackPath $stage $directory) -Force | Out-Null
                }
                foreach ($mod in $selected) {
                    $fileName = $mod.name + '.tmod'
                    $payloadRelative = $fileName
                    if ($mod.PSObject.Properties['payloadFile']) { $payloadRelative = [string]$mod.payloadFile }
                    $payload = Get-PackPath (Join-Path $PSScriptRoot 'payload') $payloadRelative
                    Copy-Item -LiteralPath $payload -Destination (Get-PackPath $stage ('Mods\' + $fileName))
                }
                Write-PackJson (Get-PackPath $stage 'Mods\enabled.json') @($selected.name)
                foreach ($config in $manifest.presets) {
                    if ($config.file -notmatch '^[A-Za-z0-9_]+\.json$') { throw 'Nome de preset invalido.' }
                    Write-PackJson (Get-PackPath $stage ('ModConfigs\' + $config.file)) $config.values
                }
                foreach ($preset in Get-ChildItem -LiteralPath (Join-Path $PSScriptRoot 'presets\ModConfigs') -File -Filter '*.json') {
                    $destination = Get-PackPath $stage ('ModConfigs\' + $preset.Name)
                    if (Test-Path -LiteralPath $destination) { throw "Preset duplicado: $($preset.Name)" }
                    Copy-Item -LiteralPath $preset.FullName -Destination $destination
                }
                Copy-Item -LiteralPath (Join-Path $PSScriptRoot 'presets\config.json') -Destination $stage
                Test-ProfileFiles $stage
                [IO.Directory]::Move($stage, $profileRoot)
                $prepared = $true
            }
        }
        finally {
            if ($preparationLocked) { $preparation.ReleaseMutex() }
            $preparation.Dispose()
        }
    }

    if (-not $prepared) { Test-ProfileFiles $profileRoot }
    Write-Host "$($selected.Count) mods conferidos. Dados em $profileRoot"
    if ($Modo -ne 'Cliente') { return }

    Push-Location $tml.Path
    try {
        & $runtime (Join-Path $tml.Path 'tModLoader.dll') -nosteam -tmlsavedirectory $profileRoot -modpath (Get-PackPath $profileRoot 'Mods')
        if ($LASTEXITCODE) { throw "O tModLoader terminou com codigo $LASTEXITCODE." }
    }
    finally { Pop-Location }
}
finally {
    if ($sessionLocked) { $session.ReleaseMutex() }
    if ($session) { $session.Dispose() }
}
