#!/usr/bin/env pwsh
#Requires -Version 5.1

<#
.SYNOPSIS
    Script de instalação automática das extensões e configurações do VS Code
.DESCRIPTION
    Este script instala todas as extensões listadas em extensions.txt e
    copia as configurações para o diretório do VS Code
.NOTES
    Autor: Seu Nome
    Data: Outubro 2025
#>

# Configurações
$ErrorActionPreference = "Continue"
$ProgressPreference = "SilentlyContinue"

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
║     VS CODE - INSTALADOR DE CONFIGURAÇÕES            ║
║                                                       ║
╚═══════════════════════════════════════════════════════╝
"@ -Color Cyan

# Verificar se o VS Code está instalado
Write-ColorOutput "`n[1/4] Verificando instalação do VS Code..." -Color Yellow
$codeCommand = Get-Command code -ErrorAction SilentlyContinue

if (-not $codeCommand) {
    Write-ColorOutput "❌ VS Code não encontrado! Por favor, instale o VS Code primeiro." -Color Red
    Write-ColorOutput "   Download: https://code.visualstudio.com/download" -Color White
    exit 1
}

Write-ColorOutput "✅ VS Code encontrado: $($codeCommand.Source)" -Color Green

# Caminhos
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ExtensionsFile = Join-Path $ScriptDir "extensions.txt"
$SettingsFile = Join-Path $ScriptDir "settings.json"
$KeybindingsFile = Join-Path $ScriptDir "keybindings.json"
$VSCodeUserDir = "$env:APPDATA\Code\User"

# Criar diretório do usuário se não existir
if (-not (Test-Path $VSCodeUserDir)) {
    New-Item -ItemType Directory -Path $VSCodeUserDir -Force | Out-Null
}

# Instalar extensões
Write-ColorOutput "`n[2/4] Instalando extensões..." -Color Yellow

if (Test-Path $ExtensionsFile) {
    $extensions = Get-Content $ExtensionsFile | Where-Object { $_ -and $_.Trim() -ne "" }
    $totalExtensions = $extensions.Count
    $currentExtension = 0
    
    Write-ColorOutput "📦 Total de extensões: $totalExtensions" -Color White
    
    foreach ($extension in $extensions) {
        $currentExtension++
        $percentage = [math]::Round(($currentExtension / $totalExtensions) * 100)
        
        Write-ColorOutput "   [$currentExtension/$totalExtensions] Instalando: $extension" -Color Cyan
        
        $result = code --install-extension $extension 2>&1
        
        if ($LASTEXITCODE -eq 0) {
            Write-ColorOutput "   ✅ Instalado com sucesso" -Color Green
        } else {
            Write-ColorOutput "   ⚠️  Aviso: $extension" -Color Yellow
        }
    }
    
    Write-ColorOutput "`n✅ Instalação de extensões concluída!" -Color Green
} else {
    Write-ColorOutput "❌ Arquivo extensions.txt não encontrado!" -Color Red
}

# Copiar settings.json
Write-ColorOutput "`n[3/4] Copiando configurações (settings.json)..." -Color Yellow

if (Test-Path $SettingsFile) {
    $destinationSettings = Join-Path $VSCodeUserDir "settings.json"
    
    # Backup do arquivo existente
    if (Test-Path $destinationSettings) {
        $backupFile = Join-Path $VSCodeUserDir "settings.json.backup.$(Get-Date -Format 'yyyyMMdd_HHmmss')"
        Copy-Item $destinationSettings $backupFile
        Write-ColorOutput "   📦 Backup criado: settings.json.backup" -Color Cyan
    }
    
    Copy-Item $SettingsFile $destinationSettings -Force
    Write-ColorOutput "   ✅ settings.json copiado com sucesso!" -Color Green
} else {
    Write-ColorOutput "   ⚠️  Arquivo settings.json não encontrado!" -Color Yellow
}

# Copiar keybindings.json
Write-ColorOutput "`n[4/4] Copiando atalhos de teclado (keybindings.json)..." -Color Yellow

if (Test-Path $KeybindingsFile) {
    $destinationKeybindings = Join-Path $VSCodeUserDir "keybindings.json"
    
    # Backup do arquivo existente
    if (Test-Path $destinationKeybindings) {
        $backupFile = Join-Path $VSCodeUserDir "keybindings.json.backup.$(Get-Date -Format 'yyyyMMdd_HHmmss')"
        Copy-Item $destinationKeybindings $backupFile
        Write-ColorOutput "   📦 Backup criado: keybindings.json.backup" -Color Cyan
    }
    
    Copy-Item $KeybindingsFile $destinationKeybindings -Force
    Write-ColorOutput "   ✅ keybindings.json copiado com sucesso!" -Color Green
} else {
    Write-ColorOutput "   ⚠️  Arquivo keybindings.json não encontrado!" -Color Yellow
}

# Finalização
Write-ColorOutput @"

╔═══════════════════════════════════════════════════════╗
║                                                       ║
║     ✅ INSTALAÇÃO CONCLUÍDA COM SUCESSO!              ║
║                                                       ║
║     Por favor, reinicie o VS Code para aplicar        ║
║     todas as configurações.                           ║
║                                                       ║
╚═══════════════════════════════════════════════════════╝

"@ -Color Green

Write-ColorOutput "Pressione qualquer tecla para sair..." -Color Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
