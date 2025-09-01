# IT HEALTH TOOLS

![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D4?style=for-the-badge&logo=windows&logoColor=white)

### Descrição

O **IT HEALTH TOOLS** é um painel de controle de linha de comando, criado em PowerShell, para simplificar e automatizar tarefas de manutenção e diagnóstico em sistemas Windows. Projetado para ser uma solução centralizada, ele consolida comandos complexos numa interface de menu simples e interativa, ideal tanto para utilizadores iniciantes quanto para técnicos de suporte.

### Funcionalidades

- **Diagnóstico de Sistema:** Executa verificações de sistema (`sfc /scannow`), testa a saúde do disco (`chkdsk`) e exibe informações detalhadas do hardware e do software.
- **Manutenção e Reparo:** Cria pontos de restauração do sistema, configura o perfil do Firewall e otimiza o sistema através da remoção de bloatware.
- **Utilitários de Acesso Rápido:** Oferece acesso instantâneo a ferramentas essenciais do Windows, como o Gerenciador de Tarefas, o Editor de Registro e o Prompt de Comando.
- **Rede e Conectividade:** Limpa o cache de DNS e exibe informações de rede, como endereços IP locais e públicos.

<img width="864" height="739" alt="image" src="https://github.com/user-attachments/assets/777a6a0a-9142-4840-b180-8ad3b4b33f28" />


### Como Usar

A forma mais prática e segura de usar o **IT HEALTH TOOLS** é através de um ficheiro de execução (`.bat`). Isso permite que você inicie o painel com um duplo clique, sem precisar digitar comandos no terminal.

1.  **Salve o script principal** na sua pasta de projeto com o nome **`painel.ps1`**.
2.  **Crie um ficheiro de execução** na mesma pasta. Abra o Bloco de Notas, cole o código abaixo e salve-o como **`iniciar.bat`**.

```bat
@echo off
rem Este script executa o seu script PowerShell
set SCRIPT_DIR=%~dp0
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_DIR%painel.ps1"
pause
