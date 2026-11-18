@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Executar-Perfil.ps1" -Modo Cliente %*
set "RESULT=%ERRORLEVEL%"
if not "%RESULT%"=="0" pause
exit /b %RESULT%
