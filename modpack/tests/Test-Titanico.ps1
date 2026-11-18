#requires -Version 5.1
$ErrorActionPreference = 'Stop'
$pack = Split-Path $PSScriptRoot -Parent
Import-Module (Join-Path $pack 'lib\WorldSafety.psm1') -Force
Import-Module (Join-Path $pack 'lib\Pack.psm1') -Force
$fixtures = Join-Path ([IO.Path]::GetTempPath()) ('TerrariaTitanSafety-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $fixtures | Out-Null

function New-WorldFixture([string]$Name, [int]$Width, [int]$Height) {
    $path = Join-Path $fixtures $Name
    $stream = [IO.File]::Create($path)
    $writer = [IO.BinaryWriter]::new($stream)
    try {
        $writer.Write([int]279)
        $writer.Write([Text.Encoding]::ASCII.GetBytes("relogic"))
        $writer.Write([byte]2)
        $writer.Write([uint32]1)
        $writer.Write([uint64]0)
        $writer.Write([int16]1)
        $writer.Write([int]128)
        $stream.Position = 128
        $writer.Write('Fixture')
        $writer.Write('seed')
        $writer.Write([uint64]0)
        $writer.Write([byte[]]::new(16))
        foreach ($value in @(1,0,($Width*16),0,($Height*16),$Height,$Width,1)) { $writer.Write([int]$value) }
        $stream.SetLength(512)
    }
    finally { $writer.Dispose() }
    return $path
}

$normal = New-WorldFixture 'normal.wld' 8400 2400
$titan = New-WorldFixture 'titan.wld' 16800 4800
$legacy = New-WorldFixture 'legacy.wld' 16000 8000
Assert-PackWorldFile $normal $false
Assert-PackWorldFile $titan $true
foreach ($world in @($titan,$legacy)) {
    $blocked = $false
    try { Assert-PackWorldFile $world $false } catch { $blocked = $_.Exception.Message -match 'bloqueado' }
    if (-not $blocked) { throw "Expanded world was not blocked: $world" }
}
$invalid = Join-Path $fixtures 'invalid.wld'
[IO.File]::WriteAllBytes($invalid, [byte[]]@(0,0,0))
$blocked = $false
try { Assert-PackWorldFile $invalid $false } catch { $blocked = $true }
if (-not $blocked) { throw 'Truncated world was accepted.' }

$manifest = Read-PackJson (Join-Path $pack 'profiles\TodosRecuperados-Titanico-Desempenho.lock.json')
$selection = @(Get-PackSelection $manifest 5 @())
if ($selection.Count -ne 71) { throw 'Unexpected mod count.' }
foreach ($mod in @('TitanWorlds','miningcracks_take_on_luiafk','BetterZoom')) {
    if ($mod -notin $selection.name) { throw "Required mod is missing: $mod" }
}
$compat = $selection | Where-Object name -eq TerrariaPackCompat
if ($compat.version -ne '1.2.0') { throw 'The audited performance compatibility version is missing.' }
$titan = $manifest.presets | Where-Object file -eq TitanWorlds_TitanWorldServerConfig.json
if ($titan.values.ForceTitanWorldOnDedicatedServer -ne $true) { throw 'Titanic world generation is disabled.' }

Write-Output 'Passed: normal world, Titanic world, legacy expansion rejection, truncated file, active mod selection and Titanic preset.'
Write-Output "Temporary fixtures: $fixtures"
