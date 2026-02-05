@echo off
REM Check OpenVPN Connection Status

echo Checking OpenVPN connection status...
echo.

REM Check if OpenVPN process is running
tasklist /FI "IMAGENAME eq openvpn.exe" 2>NUL | find /I /N "openvpn.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo [OK] OpenVPN process is running
) else (
    echo [FAIL] OpenVPN process is NOT running
)

echo.
echo Network Adapters:
netsh interface show interface | findstr /C:"Connected" /C:"TAP" /C:"OpenVPN"

echo.
echo Your current public IP:
curl -s ifconfig.me
echo.

pause
