#!/bin/bash

# Script de backup das extensões e configurações do VS Code
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
echo "║     VS CODE - BACKUP DE CONFIGURAÇÕES                 ║"
echo "║                                                       ║"
echo "╚═══════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Verificar se o VS Code está instalado
echo -e "${YELLOW}[1/3] Verificando instalação do VS Code...${NC}"

if ! command -v code &> /dev/null; then
    echo -e "${RED}❌ VS Code não encontrado!${NC}"
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

# Backup das extensões
echo -e "\n${YELLOW}[2/3] Fazendo backup da lista de extensões...${NC}"
code --list-extensions > "$EXTENSIONS_FILE"

if [ -f "$EXTENSIONS_FILE" ]; then
    EXTENSION_COUNT=$(wc -l < "$EXTENSIONS_FILE" | tr -d ' ')
    echo -e "${GREEN}✅ $EXTENSION_COUNT extensões salvas em extensions.txt${NC}"
else
    echo -e "${RED}❌ Erro ao listar extensões!${NC}"
fi

# Backup das configurações
echo -e "\n${YELLOW}[3/3] Fazendo backup das configurações...${NC}"

SOURCE_SETTINGS="$VSCODE_USER_DIR/settings.json"
if [ -f "$SOURCE_SETTINGS" ]; then
    cp "$SOURCE_SETTINGS" "$SETTINGS_FILE"
    echo -e "${GREEN}✅ settings.json copiado!${NC}"
else
    echo -e "${YELLOW}⚠️  settings.json não encontrado!${NC}"
fi

SOURCE_KEYBINDINGS="$VSCODE_USER_DIR/keybindings.json"
if [ -f "$SOURCE_KEYBINDINGS" ]; then
    cp "$SOURCE_KEYBINDINGS" "$KEYBINDINGS_FILE"
    echo -e "${GREEN}✅ keybindings.json copiado!${NC}"
else
    echo -e "${YELLOW}⚠️  keybindings.json não encontrado!${NC}"
fi

# Finalização
echo -e "\n${GREEN}"
echo "╔═══════════════════════════════════════════════════════╗"
echo "║                                                       ║"
echo "║     ✅ BACKUP CONCLUÍDO COM SUCESSO!                  ║"
echo "║                                                       ║"
echo "║     Não se esqueça de fazer commit e push das         ║"
echo "║     alterações para o GitHub!                         ║"
echo "║                                                       ║"
echo "╚═══════════════════════════════════════════════════════╝"
echo -e "${NC}\n"

echo -e "${CYAN}Comandos sugeridos:${NC}"
echo "  git add ."
echo "  git commit -m 'Atualizar configurações do VS Code'"
echo "  git push"
echo ""
