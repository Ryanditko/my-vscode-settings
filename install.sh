#!/bin/bash

# Script de instalação automática das extensões e configurações do VS Code
# Para Linux e MacOS

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}"
echo "╔═══════════════════════════════════════════════════════╗"
echo "║                                                       ║"
echo "║     VS CODE - INSTALADOR DE CONFIGURAÇÕES            ║"
echo "║                                                       ║"
echo "╚═══════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Verificar se o VS Code está instalado
echo -e "${YELLOW}[1/4] Verificando instalação do VS Code...${NC}"

if ! command -v code &> /dev/null; then
    echo -e "${RED}❌ VS Code não encontrado! Por favor, instale o VS Code primeiro.${NC}"
    echo -e "   Download: https://code.visualstudio.com/download"
    exit 1
fi

echo -e "${GREEN}✅ VS Code encontrado!${NC}"

# Determinar o sistema operacional
if [[ "$OSTYPE" == "darwin"* ]]; then
    VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
else
    VSCODE_USER_DIR="$HOME/.config/Code/User"
fi

# Obter o diretório do script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTENSIONS_FILE="$SCRIPT_DIR/extensions.txt"
SETTINGS_FILE="$SCRIPT_DIR/settings.json"
KEYBINDINGS_FILE="$SCRIPT_DIR/keybindings.json"

# Criar diretório do usuário se não existir
mkdir -p "$VSCODE_USER_DIR"

# Instalar extensões
echo -e "\n${YELLOW}[2/4] Instalando extensões...${NC}"

if [ -f "$EXTENSIONS_FILE" ]; then
    TOTAL_EXTENSIONS=$(wc -l < "$EXTENSIONS_FILE" | tr -d ' ')
    echo -e "${CYAN}📦 Total de extensões: $TOTAL_EXTENSIONS${NC}"
    
    CURRENT=0
    while IFS= read -r extension; do
        if [ -n "$extension" ]; then
            ((CURRENT++))
            echo -e "${CYAN}   [$CURRENT/$TOTAL_EXTENSIONS] Instalando: $extension${NC}"
            
            if code --install-extension "$extension" &> /dev/null; then
                echo -e "${GREEN}   ✅ Instalado com sucesso${NC}"
            else
                echo -e "${YELLOW}   ⚠️  Aviso: $extension${NC}"
            fi
        fi
    done < "$EXTENSIONS_FILE"
    
    echo -e "\n${GREEN}✅ Instalação de extensões concluída!${NC}"
else
    echo -e "${RED}❌ Arquivo extensions.txt não encontrado!${NC}"
fi

# Copiar settings.json
echo -e "\n${YELLOW}[3/4] Copiando configurações (settings.json)...${NC}"

if [ -f "$SETTINGS_FILE" ]; then
    DESTINATION_SETTINGS="$VSCODE_USER_DIR/settings.json"
    
    # Backup do arquivo existente
    if [ -f "$DESTINATION_SETTINGS" ]; then
        BACKUP_FILE="$VSCODE_USER_DIR/settings.json.backup.$(date +%Y%m%d_%H%M%S)"
        cp "$DESTINATION_SETTINGS" "$BACKUP_FILE"
        echo -e "${CYAN}   📦 Backup criado: settings.json.backup${NC}"
    fi
    
    cp "$SETTINGS_FILE" "$DESTINATION_SETTINGS"
    echo -e "${GREEN}   ✅ settings.json copiado com sucesso!${NC}"
else
    echo -e "${YELLOW}   ⚠️  Arquivo settings.json não encontrado!${NC}"
fi

# Copiar keybindings.json
echo -e "\n${YELLOW}[4/4] Copiando atalhos de teclado (keybindings.json)...${NC}"

if [ -f "$KEYBINDINGS_FILE" ]; then
    DESTINATION_KEYBINDINGS="$VSCODE_USER_DIR/keybindings.json"
    
    # Backup do arquivo existente
    if [ -f "$DESTINATION_KEYBINDINGS" ]; then
        BACKUP_FILE="$VSCODE_USER_DIR/keybindings.json.backup.$(date +%Y%m%d_%H%M%S)"
        cp "$DESTINATION_KEYBINDINGS" "$BACKUP_FILE"
        echo -e "${CYAN}   📦 Backup criado: keybindings.json.backup${NC}"
    fi
    
    cp "$KEYBINDINGS_FILE" "$DESTINATION_KEYBINDINGS"
    echo -e "${GREEN}   ✅ keybindings.json copiado com sucesso!${NC}"
else
    echo -e "${YELLOW}   ⚠️  Arquivo keybindings.json não encontrado!${NC}"
fi

# Finalização
echo -e "\n${GREEN}"
echo "╔═══════════════════════════════════════════════════════╗"
echo "║                                                       ║"
echo "║     ✅ INSTALAÇÃO CONCLUÍDA COM SUCESSO!              ║"
echo "║                                                       ║"
echo "║     Por favor, reinicie o VS Code para aplicar        ║"
echo "║     todas as configurações.                           ║"
echo "║                                                       ║"
echo "╚═══════════════════════════════════════════════════════╝"
echo -e "${NC}\n"
