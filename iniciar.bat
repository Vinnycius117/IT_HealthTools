@echo off
:: ------------------------------------------------------------
:: Script para iniciar o painel PowerShell (IT HEALTH TOOLS)
:: Autor: Vinnycius Souza Leal
:: Versão: 1.1
:: ------------------------------------------------------------

:: Verifica se está sendo executado como administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ====================================================
    echo  Este script precisa ser executado como ADMINISTRADOR
    echo  Clique com o botao direito no arquivo e escolha:
    echo  "Executar como administrador"
    echo ====================================================
    pause
    exit /b
)

:: Obtém o diretório do script
set "SCRIPT_DIR=%~dp0"

:: Mensagem de inicialização
echo.
echo Iniciando IT HEALTH TOOLS...
echo Local do script: %SCRIPT_DIR%
echo.

:: Executa o script PowerShell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_DIR%painel.ps1"

:: Mensagem final
echo.
echo Script finalizado. Pressione qualquer tecla para sair.
pause >nul

