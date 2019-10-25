Param (
    $Resolution = ($env:WallpaperResolution, '1920x1080' | Select-Object -First 1),
    $EnSearch = ($env:WallpaperEnSearch, 0 | Select-Object -First 1),
    $DaysAgo = ($env:WallpaperDaysAgo, 0 | Select-Object -First 1)
)
$Wallpaper = "$env:TMP\wallpaper.jpg"

# Download wallpaper
[xml]$Bing = Invoke-WebRequest "www.bing.com/HPImageArchive.aspx?n=1&idx=$DaysAgo&ensearch=$EnSearch" -UseBasicParsing
Invoke-WebRequest "www.bing.com$($Bing.images.image.urlBase)_$Resolution.jpg" -UseBasicParsing -OutFile $Wallpaper

# Set wallpaper
(Add-Type -MemberDefinition '[DllImport("user32.dll")]public static extern bool SystemParametersInfo (uint uiAction, uint uiParam, String pvParam, uint fWinIni);' -Name 'Params' -PassThru)::SystemParametersInfo(20, 0, $Wallpaper, 3)

Remove-Item $Wallpaper -Force
