New-Item $env:USERPROFILE\BingWallpaper.js -Value "(new ActiveXObject('WScript.Shell')).run('powershell -NoProfile -NonInteractive iwr -useb github.com/star2000/BingWallpaper/raw/master/wallup.ps1 | iex', 0)" -Force | Out-Null

Register-ScheduledTask BingWallpaper star2000 (
    New-ScheduledTaskAction $env:USERPROFILE\BingWallpaper.js
) (
    New-ScheduledTaskTrigger -Daily -At 0:0
) (
    New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -RunOnlyIfNetworkAvailable -StartWhenAvailable
) -Force | Out-Null

Start-ScheduledTask BingWallpaper star2000
