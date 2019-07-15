Param (
    $Path = "$env:USERPROFILE\Pictures\wallpaper.jpg",
    $Resolution = '1920x1080',
    $ensearch = 0,
    $idx = 0
)

#下载壁纸
[xml]$Bing = (New-Object System.Net.WebClient -Property @{Encoding = [Text.Encoding]::UTF8 }).DownloadString("http://www.bing.com/HPImageArchive.aspx?n=1&idx=$idx&ensearch=$ensearch")
$ImageUrl = "http://www.bing.com$($Bing.images.image.urlBase)_$Resolution.jpg"
(New-Object System.Net.WebClient).DownloadFile($ImageUrl, $Path)

# 设置壁纸
(Add-Type -MemberDefinition '[DllImport("user32.dll")]public static extern bool 
SystemParametersInfo (uint uiAction, uint uiParam, String pvParam, uint fWinIni);' -Name 'Params' -PassThru)::SystemParametersInfo(20, 0, $Path, 3)
