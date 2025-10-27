# VS Code Settings & Extensions

Este repositório contém todas as minhas configurações, extensões e snippets do Visual Studio Code para facilitar a migração e sincronização entre diferentes máquinas.

## 📦 O que está incluído

- ✅ Lista de extensões instaladas
- ✅ Configurações do VS Code (`settings.json`)
- ✅ Atalhos de teclado personalizados (`keybindings.json`)
- ✅ Scripts de instalação automatizada
- ✅ Snippets personalizados

## 🚀 Instalação Rápida

### Windows (PowerShell)

```powershell
# Clone o repositório
git clone https://github.com/SEU_USUARIO/vscode-settings.git
cd vscode-settings

# Execute o script de instalação
.\install.ps1
```

### Linux/MacOS

```bash
# Clone o repositório
git clone https://github.com/SEU_USUARIO/vscode-settings.git
cd vscode-settings

# Dê permissão de execução e execute o script
chmod +x install.sh
./install.sh
```

## 📋 Instalação Manual

### 1. Instalar Extensões

#### Windows (PowerShell)
```powershell
Get-Content extensions.txt | ForEach-Object { code --install-extension $_ }
```

#### Linux/MacOS (Bash)
```bash
cat extensions.txt | xargs -L 1 code --install-extension
```

### 2. Copiar Configurações

Copie o conteúdo de `settings.json` para:
- **Windows**: `%APPDATA%\Code\User\settings.json`
- **Linux**: `~/.config/Code/User/settings.json`
- **MacOS**: `~/Library/Application Support/Code/User/settings.json`

### 3. Copiar Atalhos de Teclado (Opcional)

Se você tem atalhos personalizados, copie `keybindings.json` para o mesmo diretório acima.

## 🔄 Atualizar suas Configurações

Para atualizar este repositório com suas configurações atuais, execute:

### Windows
```powershell
.\backup.ps1
```

### Linux/MacOS
```bash
./backup.sh
```

## 📝 Extensões Incluídas

Total de extensões: **73**

### Principais categorias:
- 🎨 **Temas**: Dracula, Cursor Dark, AMOLED Black, etc.
- 🐍 **Python**: Python, Pylance, Debugpy, Jupyter
- ☕ **Java**: Java Extension Pack, Maven, Gradle
- 🗄️ **Database**: MSSQL, MongoDB snippets
- 🎯 **Git**: GitLens, Git Graph, Git History
- 🎭 **AI**: GitHub Copilot, DeepSeek
- 🛠️ **Utilitários**: REST Client, Docker, Live Server
- 💅 **Formatação**: Prettier, Auto Close Tag
- 📊 **Visualização**: PDF viewer, Rainbow CSV

## ⚙️ Principais Configurações

- Word wrap habilitado
- Auto save após delay
- Activity bar no topo
- Material Icon Theme
- Formatação automática com Prettier para JS/TS

## 🤝 Contribuindo

Sinta-se à vontade para sugerir melhorias ou compartilhar suas próprias configurações!

## 📄 Licença

MIT License - Use como quiser!

---

**Última atualização**: Outubro 2025
