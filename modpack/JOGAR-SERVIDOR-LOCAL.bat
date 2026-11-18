@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Servidor-Local.ps1" -Modo Sessao %*
set "RESULT=%ERRORLEVEL%"
if not "%RESULT%"=="0" pause
exit /b %RESULT%
