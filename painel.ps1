# ————————————————————————————————
# Seção de Funções
# ————————————————————————————————

# Opção 1: Limpar cache DNS
function Clear-DnsCache {
    Write-Host "Limpeza do cache DNS..." -ForegroundColor Yellow
    ipconfig /flushdns
    Write-Host "Cache DNS limpo com sucesso!" -ForegroundColor Green
}

# Opção 2: Testar conexão com o Google
function Test-ConnectionGoogle {
    Write-Host "Testando conexão com o Google..." -ForegroundColor Yellow
    Test-Connection -ComputerName google.com -Count 4
}

# Opção 3: Obter IPv4 Local
function Get-LocalIPv4 {
    Write-Host "Obtendo endereço IPv4 local..." -ForegroundColor Yellow
    ipconfig | Select-String "IPv4"
}

# Opção 4: Obter IP Público
function Get-PublicIP {
    Write-Host "Obtendo endereço IP público..." -ForegroundColor Yellow
    try {
        $publicIP = Invoke-RestMethod -Uri "https://api.ipify.org"
        Write-Host "Seu IP público é: $publicIP" -ForegroundColor Cyan
    } catch {
        Write-Host "Não foi possível obter o IP público. Verifique a sua conexão com a internet." -ForegroundColor Red
    }
}

# Opção 5: Resetar IP
function Reset-NetIP {
    Write-Host "Resetando configurações de IP..." -ForegroundColor Yellow
    netsh int ip reset
    netsh winsock reset
    Write-Host "Configurações de IP resetadas. Reinicie para aplicar as alterações." -ForegroundColor Green
}

# Opção 6: Iniciar Gerenciador de Tarefas
function Start-TaskManager {
    Write-Host "Iniciando Gerenciador de Tarefas..." -ForegroundColor Yellow
    Start-Process taskmgr
}

# Opção 7: Iniciar CMD
function Start-Cmd {
    Write-Host "Iniciando Prompt de Comando..." -ForegroundColor Yellow
    Start-Process cmd
}

# Opção 8: Iniciar Editor de Registro
function Start-Regedit {
    Write-Host "Iniciando Editor de Registro..." -ForegroundColor Yellow
    Start-Process regedit
}

# Opção 9: Abrir Configurações de Rede
function Open-NetworkSettings {
    Write-Host "Abrindo Configurações de Rede..." -ForegroundColor Yellow
    Start-Process ms-settings:network-status
}

# Opção 10: Testar Disco
function Test-Drive {
    Write-Host "Verificando o disco C: (chkdsk)..." -ForegroundColor Yellow
    chkdsk C: /f
}

# Opção 11: Reparar Arquivos do Sistema
function Repair-SystemFiles {
    Write-Host "Iniciando reparo de arquivos do sistema (sfc /scannow)..." -ForegroundColor Yellow
    sfc /scannow
}

# Opção 12: Procurar Atualizações do Windows
function Invoke-WindowsUpdateDetection {
    Write-Host "Procurando por atualizações do Windows..." -ForegroundColor Yellow
    Start-Process "ms-settings:windowsupdate"
}

# Opção 13: Remover programas do Windows pré-instalados (Bloatware)
function Remove-AppxBloat {
    Write-Host "Removendo bloatware..." -ForegroundColor Yellow
    # O comando Get-AppxPackage é redirecionado para Out-Null para evitar que a barra de progresso apareça na tela.
    Get-AppxPackage *candycrush* | Remove-AppxPackage | Out-Null
    Get-AppxPackage *Microsoft.BingNews* | Remove-AppxPackage | Out-Null
    Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage | Out-Null
    Write-Host "Bloatware removido." -ForegroundColor Green
}

# Opção 14: Iniciar Verificação Rápida do Defender
function Start-DefenderQuickScan {
    Write-Host "Iniciando verificação rápida do Windows Defender..." -ForegroundColor Yellow
    Start-Process "powershell.exe" -ArgumentList "Start-MpScan -ScanType QuickScan" -Wait
}

# Opção 15: Criar Ponto de Restauração
function New-RestorePoint {
    Write-Host "Criando um ponto de restauração do sistema..." -ForegroundColor Yellow
    
    try {
        # Tenta verificar e iniciar o serviço de restauração do sistema
        $service = Get-Service -Name "vss"
        if ($service.Status -ne "Running") {
            Write-Host "O serviço de Restauração do Sistema está desabilitado. Tentando ativá-lo..." -ForegroundColor Yellow
            Start-Service -Name "vss" -ErrorAction Stop | Out-Null
        }

        # Tenta criar o ponto de restauração
        Checkpoint-Computer -Description "Ponto de Restauração Criado pelo IT HEALTH TOOLS" -ErrorAction Stop | Out-Null
        
        # Se chegar aqui, significa que o comando foi bem-sucedido
        Write-Host "Ponto de restauração criado com sucesso!" -ForegroundColor Green
    
    } catch {
        # Se ocorrer um erro, mostra uma mensagem amigável
        Write-Host "Erro ao criar ponto de restauração:" -ForegroundColor Red
        Write-Host "O serviço de Restauração do Sistema pode estar desabilitado ou sem espaço de disco." -ForegroundColor Red
        Write-Host "Verifique as configurações da 'Proteção do Sistema' nas propriedades do seu PC." -ForegroundColor Red
    }
}

# Opção 16: Iniciar Restauração do Sistema
function Start-SystemRestore {
    Write-Host "Iniciando Restauração do Sistema..." -ForegroundColor Yellow
    Start-Process rstrui.exe
}

# Opção 17: Listar Programas Instalados
function Get-InstalledPrograms {
    Write-Host "Listando programas instalados (pode demorar)..." -ForegroundColor Yellow
    Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table -AutoSize
}

# Opção 18: Abrir SpeedTest
function Open-SpeedTest {
    Write-Host "Abrindo SpeedTest no navegador..." -ForegroundColor Yellow
    Start-Process "https://www.speedtest.net/"
}

# Opção 19: Obter Informações do Sistema
function Get-SystemInfo {
    Write-Host "Obtendo informações do sistema..." -ForegroundColor Yellow
    systeminfo
}

# Opção 20: Reiniciar o Computador
function Restart-ComputerNow {
    $confirm = Read-Host "Tem certeza que deseja reiniciar agora? (s/n)"
    if ($confirm -eq 's') {
        Write-Host "Reiniciando em 5 segundos..." -ForegroundColor Red
        Start-Sleep -Seconds 5
        Restart-Computer -Force
    }
}

# Opção 21: Desligar o Computador
function Stop-ComputerNow {
    $confirm = Read-Host "Tem certeza que deseja desligar agora? (s/n)"
    if ($confirm -eq 's') {
        Write-Host "Desligando em 5 segundos..." -ForegroundColor Red
        Start-Sleep -Seconds 5
        Stop-Computer -Force
    }
}

# Opção 22: Sair do script
function Exit-HealthTools {
    Write-Host "Saindo do IT HEALTH TOOLS. Obrigado por usar!" -ForegroundColor Yellow
    Start-Sleep -Seconds 2
}

# Opção 23: Abrir Gerenciador de Tarefas na Aba de Inicialização
function Open-StartupTab {
    Write-Host "Abrindo Gerenciador de Tarefas na aba 'Inicializar'..." -ForegroundColor Yellow
    Start-Process taskmgr -ArgumentList "/0 /startup"
}

# Opção 24: Configurar Perfil do Firewall para Público
function Set-FirewallProfile {
    Write-Host "Configurando o perfil do Firewall para 'Público'..." -ForegroundColor Yellow
    
    try {
        # Tenta executar o comando com o valor de texto 'True'
        Set-NetFirewallProfile -Name 'Public' -Enabled:'True' -ErrorAction Stop | Out-Null
        
        # Se chegar aqui, o comando foi bem-sucedido
        Write-Host "Perfil do Firewall configurado para 'Público'." -ForegroundColor Green

    } catch {
        # Se ocorrer um erro, mostra uma mensagem amigável e limpa
        Write-Host "Erro ao configurar o perfil do Firewall. Verifique se tem privilégios de administrador." -ForegroundColor Red
        Write-Host "O Firewall pode já estar configurado para este perfil." -ForegroundColor Red
    }
}

# Opção 25: Abrir Ferramentas Avançadas
function Open-AdvancedTools {
    Write-Host "Abrindo Ferramentas Administrativas..." -ForegroundColor Yellow
    Start-Process "control.exe" -ArgumentList "admintools"
}

# Opção 26: Abrir Arquivos Temporários

function Open-TempFiles {
    Write-Host "Abrindo arquivos temporários..." -ForegroundColor Yellow
    Start-Process $env:temp
    Write-Host "Pasta de arquivos temporários aberta." -ForegroundColor Green
}

# ————————————————————————————————
# Execução do Menu
# ————————————————————————————————

$labels = @(
    "Limpar cache DNS",
    "Testar conexão Google",
    "Obter IPv4 Local",
    "Obter IP Público",
    "Resetar IP (requer reinício)",
    "Abrir Gerenciador de Tarefas",
    "Abrir Prompt de Comando",
    "Abrir Editor de Registro",
    "Abrir Configurações de Rede",
    "Verificar Disco (chkdsk)",
    "Reparar Arquivos do Sistema",
    "Procurar por Atualizações",
    "Remover Bloatware (Candy Crush, ...)",
    "Verificação Rápida do Windows Defender",
    "Criar Ponto de Restauração",
    "Iniciar Restauração do Sistema",
    "Listar Programas Instalados",
    "Abrir SpeedTest",
    "Obter Informações do Sistema",
    "Reiniciar o Computador",
    "Desligar o Computador",
    "Sair",
    "Abrir Gerenciador de Tarefas (Inicializar)",
    "Configurar Firewall para Público",
    "Abrir Ferramentas Administrativas",
    "Abrir Arquivos Temporários"
)

do {
    Clear-Host
    Write-Host "╔══════════════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host "║               IT HEALTH TOOLS v1.0                   ║" -ForegroundColor Green
    Write-Host "║     Modo terminal – suporte e reparo (Vinny S.L)     ║" -ForegroundColor Green
    Write-Host "╚══════════════════════════════════════════════════════╝" -ForegroundColor Green

    for ($i = 0; $i -lt $labels.Count; $i++) {
        $num = $i + 1
        Write-Host (" {0,2}. {1}" -f $num, $labels[$i]) -ForegroundColor Green
    }

    $choice = Read-Host "Selecione uma opção (1-$($labels.Count))"

    switch ($choice) {
        1  { Clear-DnsCache }
        2  { Test-ConnectionGoogle }
        3  { Get-LocalIPv4 }
        4  { Get-PublicIP }
        5  { Reset-NetIP }
        6  { Start-TaskManager }
        7  { Start-Cmd }
        8  { Start-Regedit }
        9  { Open-NetworkSettings }
        10 { Test-Drive }
        11 { Repair-SystemFiles }
        12 { Invoke-WindowsUpdateDetection }
        13 { Remove-AppxBloat }
        14 { Start-DefenderQuickScan }
        15 { New-RestorePoint }
        16 { Start-SystemRestore }
        17 { Get-InstalledPrograms }
        18 { Open-SpeedTest }
        19 { Get-SystemInfo }
        20 { Restart-ComputerNow }
        21 { Stop-ComputerNow }
        22 { Exit-HealthTools; break }
        23 { Open-StartupTab }
        24 { Set-FirewallProfile }
        25 { Open-AdvancedTools }
        26 {Open-TempFiles}
        default { Write-Host "Opção inválida! Por favor, selecione um número de 1 a $($labels.Count)." -ForegroundColor Red }
    }

    Read-Host -Prompt "Pressione Enter para continuar..."
}

while ($true)


