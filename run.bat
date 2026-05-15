@echo off
setlocal

title EXOTICKIC OPTIMIZER LAUNCHER
color 0A

set "SCRIPT_DIR=%~dp0"
set "SCRIPT_FILE=%SCRIPT_DIR%drxdvs-optimizer.ps1"

cd /d "%SCRIPT_DIR%" >nul 2>&1

if not exist "%SCRIPT_FILE%" (
    echo.
    echo [ERROR] drxdvs-optimizer.ps1 was not found.
    echo [PATH ] %SCRIPT_FILE%
    echo.
    pause
    exit /b 1
)

net session >nul 2>&1
if not "%errorlevel%"=="0" (
    echo.
    echo [EXOTICKIC] Requesting administrator access...
    echo.
    powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -WorkingDirectory '%SCRIPT_DIR%' -Verb RunAs"
    exit /b
)

set "PS_EXE=powershell.exe"

echo.
echo [EXOTICKIC] Launching optimizer terminal...
echo [EXOTICKIC] Script: %SCRIPT_FILE%
echo.

"%PS_EXE%" -NoProfile -ExecutionPolicy Bypass -NoExit -File "%SCRIPT_FILE%"

endlocal
