$ErrorActionPreference = 'Stop'

Unregister-ScheduledTask BingWallpaper \star2000\ -Confirm:$false
Remove-Item $env:USERPROFILE\BingWallpaper.vbs -Force
