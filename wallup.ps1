#download correct resolution image
$Market = "en-US"
$Resolution = "1920x1080"
$FileName = "wallpaper.jpg"
$PictureFolder = "$env:USERPROFILE\Pictures"
$PicturePath = "$($PictureFolder)\$($FileName)"
[ xml ]$Bingxml = (New-Object System.Net.WebClient).DownloadString("http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=$($Market)");
$ImageUrl = "http://www.bing.com$($Bingxml.images.image.urlBase)_$($Resolution).jpg";
Invoke-WebRequest -UseBasicParsing -Uri $ImageUrl -OutFile "$PicturePath";

#set image as wallpaper
set-itemproperty -path "HKCU:Control Panel\Desktop" -name WallPaper -value "$PicturePath";
rundll32.exe user32.dll, UpdatePerUserSystemParameters, 0, $false
