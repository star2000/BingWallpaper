$ErrorActionPreference = 'Stop'

Register-ScheduledTask BingWallpaper star2000 (
    New-ScheduledTaskAction $env:USERPROFILE\BingWallpaper.vbs
) (
    New-ScheduledTaskTrigger -Daily -At 0:0
) (
    New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -RunOnlyIfNetworkAvailable -StartWhenAvailable
) -Force

@'
CreateObject("WScript.Shell").Run "powershell -NoProfile -NonInteractive iwr -useb github.com/star2000/BingWallpaper/raw/master/wallup.ps1 | iex",0
'@ > $env:USERPROFILE\BingWallpaper.vbs

Start-ScheduledTask BingWallpaper star2000
