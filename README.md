# 每日必应壁纸
这么高质量的必应网页背景，不做壁纸真是可惜了

**使用PowerShell执行以下命令**
## 注册任务计划
### Win10
**此命令需要管理员权限**
```ps1
(New-Object Net.WebClient).DownloadString('http://raw.githubusercontent.com/star2000/BingWallpaper/master/install.ps1') | iex
```
### Win7
1. 下载[任务文件](https://raw.githubusercontent.com/star2000/BingWallpaper/master/BingWallpaper.xml)
2. `Win+R`运行`taskmgr`
3. 操作 -> 导入任务 -> 选择下载的任务
4. 点击确定，大功告成

## 立即执行
```ps1
Start-ScheduledTask BingWallpaper star2000
```
## 注销任务计划
**此命令需要管理员权限**
```ps1
Unregister-ScheduledTask BingWallpaper \star2000\
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
