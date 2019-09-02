Param (
    $WallpaperPath = ($env:WallpaperPath, "$env:USERPROFILE\Pictures" | Select-Object -First 1),
    $WallpaperResolution = ($env:WallpaperResolution, '1920x1080' | Select-Object -First 1),
    $EnSearch = ($env:EnSearch, 0 | Select-Object -First 1),
    $DaysAgo = ($env:DaysAgo, 0 | Select-Object -First 1)
)
$WallpaperPath += '\wallpaper.jpg'

# Download wallpaper
[xml]$Bing = Invoke-WebRequest "www.bing.com/HPImageArchive.aspx?n=1&idx=$DaysAgo&ensearch=$EnSearch" -UseBasicParsing
Invoke-WebRequest "www.bing.com$($Bing.images.image.urlBase)_$WallpaperResolution.jpg" -UseBasicParsing -OutFile $WallpaperPath

# Set wallpaper
(Add-Type -MemberDefinition '[DllImport("user32.dll")]public static extern bool SystemParametersInfo (uint uiAction, uint uiParam, String pvParam, uint fWinIni);' -Name 'Params' -PassThru)::SystemParametersInfo(20, 0, $WallpaperPath, 3)
