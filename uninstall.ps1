Remove-Item "$env:USERPROFILE\BingWallpaper.vbs" -Force
schtasks /Delete /TN '\star2000\BingWallpaper' /F
