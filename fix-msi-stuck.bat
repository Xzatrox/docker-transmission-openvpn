@echo off
REM Fix stuck MSI installation (Exit code 1618)
REM Run as Administrator

echo Fixing stuck MSI installation...
echo.

REM Check admin rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: Must run as Administrator
    pause
    exit /b 1
)

REM Stop Windows Installer service
echo Stopping Windows Installer service...
net stop msiserver /y

REM Kill any stuck msiexec processes
echo Killing stuck msiexec processes...
taskkill /F /IM msiexec.exe 2>nul

REM Clear MSI temp files
echo Clearing MSI temporary files...
del /F /S /Q "%TEMP%\*msi*" 2>nul
del /F /S /Q "%TEMP%\*MSI*" 2>nul

REM Clear Windows Installer cache
echo Clearing Windows Installer cache...
del /F /S /Q "C:\Windows\Installer\$PatchCache$" 2>nul

REM Restart Windows Installer service
echo Restarting Windows Installer service...
net start msiserver

echo.
echo Fix complete! Try installing OpenVPN again with:
echo   choco install openvpn -y
echo.
pause
