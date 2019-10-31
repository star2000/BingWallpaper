schtasks /Delete /TN '\star2000\BingWallpaper' /F
Remove-Item "$env:ALLUSERSPROFILE\BingWallpaper.vbs" -Force
