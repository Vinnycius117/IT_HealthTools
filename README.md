# IT HEALTH TOOLS

![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D4?style=for-the-badge&logo=windows&logoColor=white)

### Descrição

O **IT HEALTH TOOLS** é um painel de controle de linha de comando, criado em PowerShell, para simplificar e automatizar tarefas de manutenção e diagnóstico em sistemas Windows. Projetado para ser uma solução centralizada, ele consolida comandos complexos numa interface de menu simples e interativa, ideal tanto para utilizadores iniciantes quanto para técnicos de suporte.

<img width="864" height="739" alt="image" src="https://github.com/user-attachments/assets/777a6a0a-9142-4840-b180-8ad3b4b33f28" />

### Funcionalidades

- **Diagnóstico de Sistema:** Executa verificações de sistema (`sfc /scannow`), testa a saúde do disco (`chkdsk`) e exibe informações detalhadas do hardware e do software.
- **Manutenção e Reparo:** Cria pontos de restauração do sistema, configura o perfil do Firewall e otimiza o sistema através da remoção de bloatware.
- **Utilitários de Acesso Rápido:** Oferece acesso instantâneo a ferramentas essenciais do Windows, como o Gerenciador de Tarefas, o Editor de Registro e o Prompt de Comando.
- **Rede e Conectividade:** Limpa o cache de DNS e exibe informações de rede, como endereços IP locais e públicos.

<img width="476" height="117" alt="image" src="https://github.com/user-attachments/assets/486d16a0-f4c6-43c6-bfc4-a960aef0edb2" />

## Como Usar

A forma recomendada de usar o **IT HEALTH TOOLS** é através do Git. Isso garante que você tenha a versão mais recente e facilita a obtenção de futuras atualizações.

1.  **Pré-requisitos:** Certifique-se de ter o [Git](https://git-scm.com/) instalado no seu sistema.

2.  **Clone o Repositório:** Abra o seu terminal de linha de comando (CMD, PowerShell ou Git Bash), navegue até a pasta onde deseja salvar o projeto e use o seguinte comando:

    ```bash
    git clone https://github.com/Vinnycius117/IT_HealthTools.git
    ```
<img width="1109" height="202" alt="image" src="https://github.com/user-attachments/assets/26e0ad8d-6ce8-4740-9cd8-7cdb1b6dbaa3" />


3.  **Execute a Ferramenta:** Navegue para a pasta que foi criada (por exemplo, `cd IT-HEALTH-TOOLS`) e inicie o painel através do ficheiro de execução:

    ```bash
    .\iniciar.bat
    ```

<img width="672" height="106" alt="image" src="https://github.com/user-attachments/assets/14139d78-9296-4e9d-983b-82e4f40ce259" />


### Alternativa: Execução Sem o Git

Se preferir, também pode baixar os ficheiros diretamente. Baixe o `painel.ps1` e o `iniciar.bat` da página do projeto e coloque-os na mesma pasta. Para executar, basta dar um duplo clique no ficheiro **`iniciar.bat`**.
