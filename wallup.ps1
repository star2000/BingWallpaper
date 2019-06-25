#download correct resolution image
$Market = "zh-CN"
$Resolution = "1920x1080"
$FileName = "wallpaper.jpg"
$PictureFolder = "$env:USERPROFILE\Pictures"
$PicturePath = "$PictureFolder\$FileName"
[xml]$Bingxml = (New-Object System.Net.WebClient -Property @{Encoding = [Text.Encoding]::UTF8 }).DownloadString("http://cn.bing.com/HPImageArchive.aspx?n=1&mkt=$Market");
$ImageUrl = "http://cn.bing.com$($Bingxml.images.image.urlBase)_$Resolution.jpg";
(New-Object System.Net.WebClient).DownloadFile($ImageUrl, $PicturePath)

#set image as wallpaper
Set-ItemProperty -Path 'HKCU:Control Panel\Desktop' -Name 'WallPaper' -Value $PicturePath;
# from https://www.joseespitia.com/2017/09/15/set-wallpaper-powershell-function
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Params
{
    [DllImport("User32.dll",CharSet=CharSet.Unicode)]
    public static extern int SystemParametersInfo (Int32 uAction, Int32 uParam, String lpvParam, Int32 fuWinIni);
}
"@
[Params]::SystemParametersInfo(20, 0, $PicturePath, 3)
