@echo off
title EXOTICKIC OPTIMIZER
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
cd /d "%~dp0"
if not exist "drxdvs-optimizer.ps1" (
    echo [ERROR] drxdvs-optimizer.ps1 was not found in: %cd%
    pause
    exit /b
)
echo Launching EXOTICKIC Terminal...
powershell -ExecutionPolicy Bypass -NoExit -File "%~dp0drxdvs-optimizer.ps1"
pause