# VS Code Settings & Extensions

Repositório centralizado para gerenciar e sincronizar configurações, extensões e preferências do Visual Studio Code entre diferentes máquinas.

## Estrutura do Projeto

```
vscode-settings/
├── cmd/              # Scripts de instalação e backup
│   ├── install.ps1   # Instalador para Windows
│   ├── install.sh    # Instalador para Linux/MacOS
│   ├── backup.ps1    # Backup para Windows
│   └── backup.sh     # Backup para Linux/MacOS
├── docs/             # Documentação e listas
│   └── extensions.txt    # Lista de extensões instaladas
├── json/             # Arquivos de configuração
│   └── settings/
│       └── settings.json # Configurações do VS Code
└── README.md
```

## Instalação

### Windows (PowerShell)

```powershell
# Clone o repositório
git clone https://github.com/Ryanditko/my-vscode-settings.git
cd my-vscode-settings

# Execute o instalador
.\cmd\install.ps1
```

### Linux/MacOS

```bash
# Clone o repositório
git clone https://github.com/Ryanditko/my-vscode-settings.git
cd my-vscode-settings

# Execute o instalador
chmod +x cmd/install.sh
./cmd/install.sh
```

Após a instalação, reinicie o VS Code para aplicar todas as configurações.

## Atualizar Configurações

Para atualizar o repositório com suas configurações atuais:

### Windows
```powershell
.\cmd\backup.ps1
```

### Linux/MacOS
```bash
chmod +x cmd/backup.sh
./cmd/backup.sh
```

Depois execute:
```bash
git add .
git commit -m "Atualizar configurações"
git push
```

## Extensões Incluídas

Total: **73 extensões**

### Categorias Principais

**Temas e Aparência**
- Dracula Theme, Cursor Dark, AMOLED Black
- Material Icon Theme, Easy Icons, VSCode Icons

**Desenvolvimento Python**
- Python, Pylance, Debugpy
- Jupyter Notebook e extensões relacionadas

**Desenvolvimento Java**
- Java Extension Pack, Maven, Gradle, Oracle Java

**Banco de Dados**
- MSSQL Tools
- MongoDB Snippets

**Git e Controle de Versão**
- GitLens, Git Graph, Git History
- Open in GitHub

**Inteligência Artificial**
- GitHub Copilot & Copilot Chat
- DeepSeek integrations

**Ferramentas Web**
- Live Server (2 variantes)
- REST Client, Edge DevTools
- Tailwind CSS IntelliSense

**Qualidade de Código**
- Prettier, HTMLHint, StyleLint
- Code Spell Checker

**Utilitários**
- Docker & Containers, TODO Tree
- Better Comments, Auto Close Tag
- DotENV, Rainbow CSV, CodeSnap
- PDF Viewer, Resource Monitor
- Discord Presence

## Principais Configurações

```json
{
  "editor.wordWrap": "on",
  "files.autoSave": "afterDelay",
  "explorer.confirmDelete": false,
  "explorer.confirmDragAndDrop": false,
  "explorer.compactFolders": false,
  "workbench.iconTheme": "material-icon-theme",
  "workbench.colorTheme": "Cursor Dark High Contrast",
  "workbench.activityBar.location": "top"
}
```

### Formatadores Configurados
- **JavaScript/TypeScript**: Prettier
- **CSS**: VS Code padrão

### Python
- Interpretador padrão configurado
- Auto imports habilitado (Tabnine)

## Instalação Manual

Se preferir instalar manualmente:

```powershell
# Windows - Instalar extensões
Get-Content docs\extensions.txt | ForEach-Object { code --install-extension $_ }

# Windows - Copiar configurações
Copy-Item json\settings\settings.json $env:APPDATA\Code\User\settings.json
```

```bash
# Linux/MacOS - Instalar extensões
cat docs/extensions.txt | xargs -L 1 code --install-extension

# Linux/MacOS - Copiar configurações
cp json/settings/settings.json ~/.config/Code/User/settings.json
```

## Solução de Problemas

### Windows: Erro ao executar script
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Extensão específica falhou
Instale manualmente:
```powershell
code --install-extension PUBLISHER.EXTENSION-NAME
```

### Configurações não foram aplicadas
1. Feche completamente o VS Code
2. Execute o script novamente
3. Reinicie o VS Code

## Licença

MIT License - Veja o arquivo [LICENSE](LICENSE) para detalhes.

---

**Última atualização**: Outubro 2025
