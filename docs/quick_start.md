# Guia Rápido de Uso# Guia de Uso Rápido



## Instalação Rápida## 🚀 Primeiro Uso



### Windows### 1. Clonar este repositório

```powershell```powershell

git clone https://github.com/Ryanditko/my-vscode-settings.gitgit clone https://github.com/SEU_USUARIO/vscode-settings.git

cd my-vscode-settingscd vscode-settings

.\cmd\install.ps1```

```

### 2. Instalar tudo automaticamente

### Linux/MacOS```powershell

```bash# Windows

git clone https://github.com/Ryanditko/my-vscode-settings.git.\install.ps1

cd my-vscode-settings

chmod +x cmd/install.sh# Linux/MacOS

./cmd/install.shchmod +x install.sh

```./install.sh

```

Reinicie o VS Code após a instalação.

### 3. Reiniciar o VS Code

## Backup das ConfiguraçõesFeche e abra o VS Code novamente para aplicar todas as configurações.



### Windows---

```powershell

.\cmd\backup.ps1## 🔄 Atualizar suas Configurações

git add .

git commit -m "Atualizar configurações"Quando você fizer mudanças no seu VS Code e quiser atualizar este repositório:

git push

``````powershell

# Windows

### Linux/MacOS.\backup.ps1

```bash

chmod +x cmd/backup.sh# Linux/MacOS

./cmd/backup.shchmod +x backup.sh

git add ../backup.sh

git commit -m "Atualizar configurações"```

git push

```Depois faça commit e push:

```bash

## Comandos Úteisgit add .

git commit -m "Atualizar configurações"

### Listar extensões instaladasgit push

```powershell```

code --list-extensions

```---



### Instalar extensão específica## 📝 Adicionar Extensões Manualmente

```powershell

code --install-extension PUBLISHER.EXTENSION-NAMESe você instalar uma nova extensão e quiser adicionar ao repositório:

```

```powershell

### Desinstalar extensão# Windows

```powershellcode --list-extensions > extensions.txt

code --uninstall-extension PUBLISHER.EXTENSION-NAME

```# Linux/MacOS

code --list-extensions > extensions.txt

## Estrutura de Diretórios```



```---

vscode-settings/

├── cmd/           - Scripts de automação## ❓ Problemas Comuns

├── docs/          - Documentação e listas

├── json/settings/ - Arquivos de configuração### Erro ao executar script no Windows

``````powershell

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

## Problemas Comuns```



**Erro de política de execução (Windows)**### Extensão não instalou

```powershellTente instalar manualmente:

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser```powershell

```code --install-extension NOME_DA_EXTENSAO

```

**Script não encontra arquivos**

- Verifique se está no diretório raiz do projeto### Configurações não aplicadas

- Use caminhos relativos corretos (./cmd/install.ps1)1. Verifique se o VS Code está fechado

2. Execute o script novamente

**Extensões não instalam**3. Reinicie o VS Code

- Verifique conexão com internet

- Tente instalar manualmente a extensão problemática---



Para mais detalhes, consulte o [README.md](../README.md) principal.## 🎯 Personalização


Você pode editar os arquivos conforme necessário:
- `settings.json` - Suas configurações do VS Code
- `extensions.txt` - Lista de extensões
- `keybindings.json` - Atalhos de teclado personalizados

---

Para mais informações, consulte o [README.md](README.md) principal.
