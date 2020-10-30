$ErrorActionPreference = 'Stop'

if ($Host.Version.Major -ge 3) {
    Register-ScheduledTask BingWallpaper star2000 (
        New-ScheduledTaskAction wscript BingWallpaper.vbs %ALLUSERSPROFILE%
    ) (
        New-ScheduledTaskTrigger -Daily -At 0:0z
    ) (
        New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -RunOnlyIfNetworkAvailable -StartWhenAvailable
    ) -Force | Out-Null
}
else {
    $Xml = "$env:TMP\BingWallpaper.xml"
    [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor 3072;
    (New-Object Net.WebClient).DownloadFile('https://raw.fastgit.org/star2000/BingWallpaper/master/BingWallpaper.xml', $Xml)
    schtasks /Create /XML $Xml /TN '\star2000\BingWallpaper' /F
    Remove-Item $Xml -Force
}

@'
CreateObject("WScript.Shell").Run "powershell -NoProfile -NonInteractive ""[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor 3072; (New-Object Net.WebClient).DownloadString('https://raw.fastgit.org/star2000/BingWallpaper/master/wallup.ps1') | iex""",0
'@ > "$env:ALLUSERSPROFILE\BingWallpaper.vbs"

schtasks /Run /TN '\star2000\BingWallpaper'
