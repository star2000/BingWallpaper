$ErrorActionPreference = 'Stop'

if ($Host.Version.Major -ge 3) {
    Register-ScheduledTask BingWallpaper star2000 (
        New-ScheduledTaskAction wscript BingWallpaper.vbs %USERPROFILE%
    ) (
        New-ScheduledTaskTrigger -Daily -At 0:0z
    ) (
        New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -RunOnlyIfNetworkAvailable -StartWhenAvailable
    ) -Force | Out-Null
}
else {
    $Xml = "$env:TMP\BingWallpaper.xml"
    (New-Object Net.WebClient).DownloadFile('http://cdn.jsdelivr.net/gh/star2000/BingWallpaper/BingWallpaper.xml', $Xml)
    schtasks /Create /XML $Xml /TN '\star2000\BingWallpaper' /F
    Remove-Item $Xml -Force
}

@'
CreateObject("WScript.Shell").Run "powershell -NoProfile -NonInteractive ""(New-Object Net.WebClient).DownloadString('http://cdn.jsdelivr.net/gh/star2000/BingWallpaper/wallup.ps1') | iex""",0
'@ > $env:USERPROFILE\BingWallpaper.vbs

schtasks /Run /TN '\star2000\BingWallpaper'
