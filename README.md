# 🍨 scoop-av 🍨

[![license](https://img.shields.io/github/license/zzhaq/scoop-av)](https://img.shields.io/github/license/zzhaq/scoop-av)
[![repo size](https://img.shields.io/github/repo-size/zzhaq/scoop-av)](https://img.shields.io/github/repo-size/zzhaq/scoop-av)

A Scoop Bucket. [Scoop](https://github.com/ScoopInstaller/Scoop)

<p align="left">
<a href="README.md">English</a> |
<a href="README-CN.md">简体中文</a>
</p>

# Install Scoop

## Step 1: Enable policy in PowerShell

* Open `PowerShell` as an Administrator
  
```powershell
set-executionpolicy Unrestricted -scope currentuser
```

## Step 2: Customize your Scoop directory

```powershell
$env:SCOOP='E:\Applications\Scoop'
$env:SCOOP_GLOBAL='E:\GlobalScoopApps'
[Environment]::SetEnvironmentVariable('SCOOP_GLOBAL', $env:SCOOP_GLOBAL, 'Machine')
```

> If you skip this step, all user installed Apps and Scoop itself will live in `c:/users/user_name/scoop`.

## Step 3: Download and install Scoop

```powershell
iwr get.scoop.sh -outfile 'scoop.ps1'
.\scoop.ps1 -RunAsAdmin
```

## step 4: Install Apps from scoop-av bucket

```powershell
scoop install aria2    #Install Aria2 to accelerate downloading (optional)
scoop install git      #Install Git to add new repositories

scoop bucket add scoop-av https://github.com/zzhaq/scoop-av   #add
scoop install xxx
```

# Install custom av-tools in a virtual machine using scoop

## Prerequisites

* Create and configure a new Windows Virtual Machine
  * av-tools is designed to be installed on Windows 7 Service Pack 1 or newer
  * Ensure VM is updated completely. You may have to check for updates, reboot, and check again until no more remain
  
* Install .NET 4.5 and WMF 5.1 from the following links:
  * .NET 4.5 [https://www.microsoft.com/en-us/download/details.aspx?id=30653](https://www.microsoft.com/en-us/download/details.aspx?id=30653)
  * WMF 5.1  [https://www.microsoft.com/en-us/download/details.aspx?id=54616](https://www.microsoft.com/en-us/download/details.aspx?id=54616)
  * Make sure you restart the VM to complete the installation
* Take a snapshot of your machine!

## Enable policy in PowerShell

* Open `PowerShell` as an Administrator
  
```powershell
set-executionpolicy Unrestricted -scope currentuser
```

## Install scoop and av-tools

```powershell
./av_install.ps1
```
