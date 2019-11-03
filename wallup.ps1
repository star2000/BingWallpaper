Param (
    $Path = $env:WallpaperPath,
    $Resolution = ($env:WallpaperResolution, '1920x1080' | Select-Object -First 1),
    $EnSearch = ($env:WallpaperEnSearch, 0 | Select-Object -First 1),
    $DaysAgo = ($env:WallpaperDaysAgo, 0 | Select-Object -First 1)
)
$ErrorActionPreference = 'Stop'
$Wallpaper = "$env:TMP\wallpaper.jpg"
$WallpaperBitmap = "$env:TMP\wallpaper.bmp"

# Download wallpaper
$WebClient = New-Object Net.WebClient
$WebClient.Encoding = [Text.Encoding]::UTF8
$Bing = [Xml]$WebClient.DownloadString("http://www.bing.com/HPImageArchive.aspx?n=1&idx=$DaysAgo&ensearch=$EnSearch")
$WebClient.DownloadFile("http://www.bing.com$($Bing.images.image.urlBase)_$Resolution.jpg", $Wallpaper)

# Set wallpaper
Add-Type -Assembly System.Drawing
$Bitmap = [Drawing.Bitmap]$Wallpaper
$Bitmap.Save($WallpaperBitmap, 'bmp')
$Bitmap.Dispose()

(Add-Type '[DllImport("user32.dll")]public static extern bool SystemParametersInfo (uint uiAction, uint uiParam, String pvParam, uint fWinIni);' -Name '_' -PassThru)::SystemParametersInfo(20, 0, $WallpaperBitmap, 3)

Remove-Item $WallpaperBitmap -Force

# Save wallpaper if $env:WallpaperPath is set
if ($Path) {
    if ($Path -notmatch '.jpg$') {
        $Path = Join-Path $Path '%F.jpg'
    }
    Copy-Item $Wallpaper $(Get-Date -UFormat $Path) -Force
}
Remove-Item $Wallpaper -Force
