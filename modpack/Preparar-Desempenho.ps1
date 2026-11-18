#requires -Version 5.1
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
& (Join-Path $PSScriptRoot 'Executar-Perfil.ps1') -Modo Preparar
