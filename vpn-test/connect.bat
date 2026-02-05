@echo off
REM FastVPN Connection Script
REM Run this as Administrator

echo Connecting to FastVPN...
echo.

REM Check if running as admin
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: This script must be run as Administrator!
    echo Right-click and select "Run as administrator"
    pause
    exit /b 1
)

REM Set paths
set SCRIPT_DIR=%~dp0
set CREDENTIALS=%SCRIPT_DIR%credentials.txt
set CONFIG=C:\projects\vpn-configs-contrib\openvpn\fastvpn\default.ovpn

REM Check if config file exists
if not exist "%CONFIG%" (
    echo ERROR: Config file not found: %CONFIG%
    pause
    exit /b 1
)

REM Check if credentials file exists
if not exist "%CREDENTIALS%" (
    echo ERROR: Credentials file not found: %CREDENTIALS%
    pause
    exit /b 1
)

echo Using config: %CONFIG%
echo Using credentials: %CREDENTIALS%
echo.

REM Connect to VPN
"C:\Program Files\OpenVPN\bin\openvpn.exe" --config "%CONFIG%" --auth-user-pass "%CREDENTIALS%" --inactive 3600 --ping 10 --ping-exit 60

pause
