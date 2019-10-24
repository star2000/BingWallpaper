Remove-Item $env:USERPROFILE\BingWallpaper.js -Force
Unregister-ScheduledTask BingWallpaper \star2000\ -Confirm:$false
