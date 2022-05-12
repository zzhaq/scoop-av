# 🍨 scoop-av 🍨

[![license](https://img.shields.io/github/license/zzhaq/scoop-av)](https://img.shields.io/github/license/zzhaq/scoop-av)
[![repo size](https://img.shields.io/github/repo-size/zzhaq/scoop-av)](https://img.shields.io/github/repo-size/zzhaq/scoop-av)

A Scoop Bucket. [Scoop](https://github.com/ScoopInstaller/Scoop)

<p align="left">
<a href="README.md">English</a> |
<a href="README-CN.md">简体中文</a>
</p>

For ones familiar with Scoop:

```powershell
scoop bucket add scoop-av https://github.com/zzhaq/scoop-av
```

# To Start

## Install Scoop

### Step 1: Enable remote policy in PowerShell

```powershell
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
```

### Step 2: Customize your Scoop directory

```powershell
$env:SCOOP='Your_Scoop_Path'
[Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User')
```

> If you skip this step, all user installed Apps and Scoop itself will live in `c:/users/user_name/scoop`.

### Step 3: Download and install Scoop

```powershell
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
```

### Step 4: Glance at quick-start by `scoop help`

For more information, please visit Scoop official site at 👉 <https://scoop.sh/> 👈

## Install Apps from this bucket

### Step 1: Install Aria2 to accelerate downloading

```powershell
scoop install aria2
```

### Step 2: Install Git to add new repositories

```powershell
scoop install git
```

if you are using VPN, you need to turn off aria2 before installing Apps

```powershell
scoop config aria2-enabled false
```

### Step 3: Add this wonderful bucket and update

```powershell
scoop bucket add scoopet https://github.com/ivaquero/scoopet
scoop update
```

### :rocket: Step 4: Install Apps

- Check the exact name of App by `scoop search`

```powershell
scoop search <app_name>
```

- Install Apps with assistance of plugin `scoop-completion`

```powershell
scoop install scoop-completion
scoop install <app_name>
```

> to use `scoop-completion`, just to hit `tab` after initial letters of App names

### Step 5: List the official recommended buckets by `scoop bucket known`

```powershell
scoop bucket known

main [default]
extras [strongly recommended]
versions
nightlies
nirsoft
php
nerd-fonts
nonportable
java
games
jetbrains
```

## Trivial

### Tweak with Parameters in Aria2

```powershell
scoop config aria2-enabled true
scoop config aria2-retry-wait 4
scoop config aria2-split 16
scoop config aria2-max-connection-per-server 16
scoop config aria2-min-split-size 4M
```
