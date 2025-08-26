@echo off
rem Este script executa o seu script PowerShell
set SCRIPT_DIR=%~dp0
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_DIR%painel.ps1"
pause