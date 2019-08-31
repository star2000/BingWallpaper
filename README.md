# BingWallpaper

每日必应壁纸

## Win8及以上

<details>

使用`PowerShell`执行以下命令

### 注册任务计划

```ps1
iwr -useb git.io/BingWallpaper | iex
```

### 立即执行

```ps1
Start-ScheduledTask BingWallpaper star2000
```

### 注销任务计划

此命令需要管理员权限

```ps1
Unregister-ScheduledTask BingWallpaper \star2000\
```

</details>

## Win7

<details>

### 注册任务计划

1. 下载[任务文件]
2. `Win+R`运行`taskschd.msc`
3. 操作 -> 导入任务 -> 选择下载的任务

### 运行任务计划

1. `Win+R`运行`taskschd.msc`
2. 打开`任务计划程序库/star2000`
3. 右击`BingWallpaper`，点运行

### 删除任务计划

1. `Win+R`运行`taskschd.msc`
2. 打开`任务计划程序库/star2000`
3. 右击`BingWallpaper`，点删除

</details>

## 设置

<details>

通过环境变量改变行为

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
  - 可选值：`0`, `1`
- 几天前
  - 环境变量名：`DaysAgo`
  - 默认值：`0`
  - 可选值：`0`, `1`, `2`, `3`, `4`, `5`, `6`, `7`

</details>

[任务文件]: https://raw.githubusercontent.com/star2000/BingWallpaper/master/BingWallpaper.xml
