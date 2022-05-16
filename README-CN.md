# 🍨 scoop-av 🍨

[![license](https://img.shields.io/github/license/zzhaq/scoop-av)](https://img.shields.io/github/license/zzhaq/scoop-av)
[![repo size](https://img.shields.io/github/repo-size/zzhaq/scoop-av)](https://img.shields.io/github/repo-size/zzhaq/scoop-av)

一个用于windows的最佳包管理器。 [Scoop](https://github.com/ScoopInstaller/Scoop)

<p align="left">
<a href="README.md">English</a> |
<a href="README-CN.md">简体中文</a>
</p>

# 安装 Scoop

## 第一步: 在 PowerShell中启用策略

* 以管理员权限打开 `PowerShell`
  
```powershell
set-executionpolicy Unrestricted -scope currentuser
```

## 第二部：自定义scoop 安装路径

```powershell
$env:SCOOP='E:\Applications\Scoop'
$env:SCOOP_GLOBAL='E:\GlobalScoopApps'
[Environment]::SetEnvironmentVariable('SCOOP_GLOBAL', $env:SCOOP_GLOBAL, 'Machine')
```

> 如果您跳过此步骤，所有用户安装的应用程序和 Scoop 都将存在 `c:/users/user_name/scoop`.

## 第三步：下载和安装Scoop

```powershell
iwr get.scoop.sh -outfile 'scoop.ps1'
.\scoop.ps1 -RunAsAdmin
```

## 第四步: 从 scoop-av 包中安装应用

```powershell
scoop install aria2    #安装 Aria2 加速下载（可选）
scoop install git      #安装 Git 以添加新的存储库

scoop bucket add scoop-av https://github.com/zzhaq/scoop-av   #add
scoop install xxx
```

# 使用 scoop 在虚拟机中安装自定义工具 av-tools

## 先决条件

* 创建和配置新的 Windows 虚拟机
  * av-tools 设计初衷是要安装在 Windows 7 Service Pack 1 或更高版本上
  * 确保 VM 已完全更新，您可能需要检查更新、重新启动并再次检查，直到不再存在未安装的更新
  
* 从以下链接安装 .NET 4.5 和 WMF 5.1:
  * .NET 4.5 [https://www.microsoft.com/en-us/download/details.aspx?id=30653](https://www.microsoft.com/en-us/download/details.aspx?id=30653)
  * WMF 5.1  [https://www.microsoft.com/en-us/download/details.aspx?id=54616](https://www.microsoft.com/en-us/download/details.aspx?id=54616)
  * 确保重新启动 VM 以完成安装
* 为您的机器拍摄快照！

## 在 PowerShell中启用策略

* 以管理员权限打开 `PowerShell`
  
```powershell
set-executionpolicy Unrestricted -scope currentuser
```

## 安装 scoop 和 av-tools

```powershell
./av_install.ps1
```
