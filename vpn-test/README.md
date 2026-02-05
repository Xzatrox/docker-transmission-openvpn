# VPN Test Setup

## Quick Start

1. **Download FastVPN config file:**
   - Go to: https://github.com/Xzatrox/vpn-configs-contrib/tree/main/openvpn/fastvpn
   - Download a `.ovpn` config file (e.g., `fastvpn-us.ovpn`)
   - Rename it to `fastvpn.ovpn` and place it in this folder

2. **Run the connection script:**
   - Right-click `connect.bat`
   - Select "Run as administrator"

3. **Check connection:**
   - Run `check-connection.bat` to verify VPN is active

## Files

- `credentials.txt` - Your FastVPN credentials
- `connect.bat` - Main connection script (run as admin)
- `check-connection.bat` - Verify VPN connection status
- `fastvpn.ovpn` - Config file (you need to download this)

## Disconnect

Press `Ctrl+C` in the terminal window or run:
```cmd
taskkill /IM openvpn.exe /F
```
