#!/usr/bin/env pwsh
#Requires -Version 5.1

<#
.SYNOPSIS
    Script de backup das extensões e configurações do VS Code
.DESCRIPTION
    Este script faz backup de todas as extensões instaladas e
    copia as configurações do VS Code para este repositório
.NOTES
    Autor: Seu Nome
    Data: Outubro 2025
#>

# Configurações
$ErrorActionPreference = "Continue"

# Cores para output
function Write-ColorOutput {
    param(
        [string]$Message,
        [string]$Color = "White"
    )
    Write-Host $Message -ForegroundColor $Color
}

# Banner
Clear-Host
Write-ColorOutput @"
╔═══════════════════════════════════════════════════════╗
║                                                       ║
║     VS CODE - BACKUP DE CONFIGURAÇÕES                 ║
║                                                       ║
╚═══════════════════════════════════════════════════════╝
"@ -Color Cyan

# Verificar se o VS Code está instalado
Write-ColorOutput "`n[1/3] Verificando instalação do VS Code..." -Color Yellow
$codeCommand = Get-Command code -ErrorAction SilentlyContinue

if (-not $codeCommand) {
    Write-ColorOutput "❌ VS Code não encontrado!" -Color Red
    exit 1
}

Write-ColorOutput "✅ VS Code encontrado!" -Color Green

# Caminhos
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RootDir = Split-Path -Parent $ScriptDir
$ExtensionsFile = Join-Path $RootDir "docs\extensions.txt"
$SettingsFile = Join-Path $RootDir "json\settings\settings.json"
$VSCodeUserDir = "$env:APPDATA\Code\User"

# Backup das extensões
Write-ColorOutput "`n[2/3] Fazendo backup da lista de extensões..." -Color Yellow
$extensions = code --list-extensions

if ($extensions) {
    $extensions | Out-File -FilePath $ExtensionsFile -Encoding UTF8
    $extensionCount = ($extensions | Measure-Object).Count
    Write-ColorOutput "✅ $extensionCount extensões salvas em extensions.txt" -Color Green
} else {
    Write-ColorOutput "❌ Erro ao listar extensões!" -Color Red
}

# Backup das configurações
Write-ColorOutput "`n[3/3] Fazendo backup das configurações..." -Color Yellow

$sourceSettings = Join-Path $VSCodeUserDir "settings.json"
if (Test-Path $sourceSettings) {
    Copy-Item $sourceSettings $SettingsFile -Force
    Write-ColorOutput "✅ settings.json copiado!" -Color Green
} else {
    Write-ColorOutput "⚠️  settings.json não encontrado!" -Color Yellow
}

# Finalização
Write-ColorOutput @"

╔═══════════════════════════════════════════════════════╗
║                                                       ║
║     ✅ BACKUP CONCLUÍDO COM SUCESSO!                  ║
║                                                       ║
║     Não se esqueça de fazer commit e push das         ║
║     alterações para o GitHub!                         ║
║                                                       ║
╚═══════════════════════════════════════════════════════╝

"@ -Color Green

Write-ColorOutput "Comandos sugeridos:" -Color Cyan
Write-ColorOutput "  git add ." -Color White
Write-ColorOutput "  git commit -m 'Atualizar configurações do VS Code'" -Color White
Write-ColorOutput "  git push" -Color White
Write-ColorOutput "`nPressione qualquer tecla para sair..." -Color Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
