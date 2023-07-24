Param (
    $Path = $env:WallpaperPath,
    $Resolution = ($env:WallpaperResolution, '1920x1080' | Select-Object -First 1),
    $EnSearch = ($env:WallpaperEnSearch, 0 | Select-Object -First 1),
    $DaysAgo = ($env:WallpaperDaysAgo, 0 | Select-Object -First 1)
)
$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor 3072
$Wallpaper = "$env:TMP\wallpaper.jpg"
$WallpaperBitmap = "$env:TMP\wallpaper.bmp"

# Download wallpaper
$WebClient = New-Object Net.WebClient
$WebClient.Encoding = [Text.Encoding]::UTF8
$Bing = [Xml]$WebClient.DownloadString("https://www.bing.com/HPImageArchive.aspx?n=1&mkt=$PSCulture&idx=$DaysAgo&ensearch=$EnSearch")
$WebClient.DownloadFile("https://www.bing.com$($Bing.images.image.urlBase)_$Resolution.jpg", $Wallpaper)

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
        $Path = Join-Path $Path '%Y-%m-%d.jpg'
    }
    Copy-Item $Wallpaper $(Get-Date -UFormat $Path) -Force
}
Remove-Item $Wallpaper -Force

# Update link
if (Test-Path "$env:ALLUSERSPROFILE\BingWallpaper.vbs") {
    @'
CreateObject("WScript.Shell").Run "powershell -NoProfile -NonInteractive ""[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor 3072; (New-Object Net.WebClient).DownloadString('https://cdn.jsdelivr.net/gh/star2000/BingWallpaper@master/wallup.ps1') | iex""",0
'@ > "$env:ALLUSERSPROFILE\BingWallpaper.vbs"
}

# Count
$ErrorActionPreference = 'SilentlyContinue'
$WebClient.DownloadString('https://cdn.jsdelivr.net/gh/star2000/count@2/count')
