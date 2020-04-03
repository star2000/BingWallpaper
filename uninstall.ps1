schtasks /Delete /TN '\star2000\BingWallpaper' /F
Remove-Item "$env:ALLUSERSPROFILE\BingWallpaper.vbs" -Force

# set wallpaper to default
$Wallpaper = "$env:SystemRoot\Web\Wallpaper\Windows\img0.jpg"
$WallpaperBitmap = "$env:TMP\wallpaper.bmp"

$ErrorActionPreference = 'Stop'

Add-Type -Assembly System.Drawing
$Bitmap = [Drawing.Bitmap]$Wallpaper
$Bitmap.Save($WallpaperBitmap, 'bmp')
$Bitmap.Dispose()

(Add-Type '[DllImport("user32.dll")]public static extern bool SystemParametersInfo (uint uiAction, uint uiParam, String pvParam, uint fWinIni);' -Name '_' -PassThru)::SystemParametersInfo(20, 0, $WallpaperBitmap, 3)

Remove-Item $WallpaperBitmap -Force
