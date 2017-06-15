#import custom modules
Import-Module posh-git #fancy git prompt

#set variables
set-location C:\Users\abhineet\Projects\ #set project folder as default location

#custom prompt
function Global:prompt {"$Env:username@$(Get-Location | Split-Path -Leaf) > "} #changed prompt to username@folderName

#alias and functions
Set-Alias ls Get-ChildItemColor -option AllScope -Force #facny pants colorful ls
Set-Alias sf screenfetch.ps1 #alias for screenfetch [https://github.com/JulianChow94/Windows-screenFetch]
Set-Alias wp wallup.ps1 #alias to script to update wallpaper to new bing image
function top {ps | sort -des cpu | select -f 10} #static top like command