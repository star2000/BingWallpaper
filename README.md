# BingWallpaper

Windows 每日必应壁纸  
最低支持Win7、Win2008

## 使用

使用`PowerShell`执行以下命令

### 安装

```ps1
(New-Object Net.WebClient).DownloadString('http://cdn.jsdelivr.net/gh/star2000/BingWallpaper/install.ps1') | iex
```

### 卸载

```ps1
(New-Object Net.WebClient).DownloadString('http://cdn.jsdelivr.net/gh/star2000/BingWallpaper/uninstall.ps1') | iex
```

## 设置

通过环境变量改变行为

- 保存路径
  - 环境变量名：`WallpaperPath`
  - 默认值：无
  - 可选值：任意有写权限的路径
  - 注意：不以`.jpg`结尾时，文件名格式默认为`%F`，参见[UNIX时间格式]
- 分辨率
  - 环境变量名：`WallpaperResolution`
  - 默认值：`1920x1080`
  - 可选值：
    - `1920x1200`
    - `1920x1080`
    - `1366x768`
    - `1280x768`
    - `1024x768`
    - `800x600`
    - `800x480`
    - `768x1280`
    - `720x1280`
    - `640x480`
    - `480x800`
    - `400x240`
    - `320x240`
    - `240x320`
- 国际版
  - 环境变量名：`WallpaperEnSearch`
  - 默认值：`0`
  - 可选值：`0`, `1`
- 几天前
  - 环境变量名：`WallpaperDaysAgo`
  - 默认值：`0`
  - 可选值：`0`, `1`, `2`, `3`, `4`, `5`, `6`, `7`

[UNIX时间格式]: https://docs.microsoft.com/zh-cn/powershell/module/microsoft.powershell.utility/get-date#notes
