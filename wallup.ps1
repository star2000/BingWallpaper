Param (
    $WallpaperPath = ($env:WallpaperPath, "$env:USERPROFILE\Pictures" | Select-Object -First 1),
    $WallpaperResolution = ($env:WallpaperResolution, '1920x1080' | Select-Object -First 1),
    $EnSearch = ($env:EnSearch, 0 | Select-Object -First 1),
    $DaysAgo = ($env:DaysAgo, 0 | Select-Object -First 1)
)
$WallpaperPath += '\wallpaper.jpg'

# Download wallpaper
[xml]$Bing = (New-Object Net.WebClient -Property @{Encoding = [Text.Encoding]::UTF8 }).DownloadString("http://www.bing.com/HPImageArchive.aspx?n=1&idx=$DaysAgo&ensearch=$EnSearch")
$ImageUrl = "http://www.bing.com$($Bing.images.image.urlBase)_$WallpaperResolution.jpg"
(New-Object Net.WebClient).DownloadFile($ImageUrl, $WallpaperPath)

# Set wallpaper
(Add-Type -MemberDefinition '[DllImport("user32.dll")]public static extern bool SystemParametersInfo (uint uiAction, uint uiParam, String pvParam, uint fWinIni);' -Name 'Params' -PassThru)::SystemParametersInfo(20, 0, $WallpaperPath, 3)
