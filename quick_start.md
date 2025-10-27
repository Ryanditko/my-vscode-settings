# Guia de Uso Rápido

## 🚀 Primeiro Uso

### 1. Clonar este repositório
```powershell
git clone https://github.com/SEU_USUARIO/vscode-settings.git
cd vscode-settings
```

### 2. Instalar tudo automaticamente
```powershell
# Windows
.\install.ps1

# Linux/MacOS
chmod +x install.sh
./install.sh
```

### 3. Reiniciar o VS Code
Feche e abra o VS Code novamente para aplicar todas as configurações.

---

## 🔄 Atualizar suas Configurações

Quando você fizer mudanças no seu VS Code e quiser atualizar este repositório:

```powershell
# Windows
.\backup.ps1

# Linux/MacOS
chmod +x backup.sh
./backup.sh
```

Depois faça commit e push:
```bash
git add .
git commit -m "Atualizar configurações"
git push
```

---

## 📝 Adicionar Extensões Manualmente

Se você instalar uma nova extensão e quiser adicionar ao repositório:

```powershell
# Windows
code --list-extensions > extensions.txt

# Linux/MacOS
code --list-extensions > extensions.txt
```

---

## ❓ Problemas Comuns

### Erro ao executar script no Windows
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Extensão não instalou
Tente instalar manualmente:
```powershell
code --install-extension NOME_DA_EXTENSAO
```

### Configurações não aplicadas
1. Verifique se o VS Code está fechado
2. Execute o script novamente
3. Reinicie o VS Code

---

## 🎯 Personalização

Você pode editar os arquivos conforme necessário:
- `settings.json` - Suas configurações do VS Code
- `extensions.txt` - Lista de extensões
- `keybindings.json` - Atalhos de teclado personalizados

---

Para mais informações, consulte o [README.md](README.md) principal.
