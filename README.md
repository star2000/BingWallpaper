# 每日必应壁纸
这么高质量的必应网页背景，不做壁纸真是可惜了

**使用PowerShell执行以下命令**
## 注册任务计划
**此命令需要管理员权限**
```ps1
Register-ScheduledTask wallup -Action (New-ScheduledTaskAction powershell { -NoLogo -NoProfile -NonInteractive -WindowStyle Hidden Invoke-Expression (New-Object Net.WebClient).DownloadString('http://github.com/star2000/BingWallpaper/raw/master/wallup.ps1') }) -Trigger (New-ScheduledTaskTrigger -Daily -At 0:0) -Settings (New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -RunOnlyIfNetworkAvailable -StartWhenAvailable -Priority 0) -AsJob
```
## 立即执行
```ps1
Start-ScheduledTask wallup
```
## 注销任务计划
```ps1
Unregister-ScheduledTask wallup
```
## 设置
**通过环境变量改变行为**

- 壁纸文件夹
  - 环境变量名：`WallpaperPath`
  - 默认值：`$env:USERPROFILE\Pictures`
  - 可选值：任意有读写权限的文件夹
- 壁纸分辨率
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
  - 环境变量名：`EnSearch`
  - 默认值：`0`
  - 可选值：`0`或`1`
- 几天前
  - 环境变量名：`DaysAgo`
  - 默认值：`0`
  - 可选值：`0`到`7`
