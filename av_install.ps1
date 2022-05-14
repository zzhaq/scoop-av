# Check to make sure script is run as administrator
Write-Host "[+] Checking if script is running as administrator.."
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal( [Security.Principal.WindowsIdentity]::GetCurrent() )
if (-Not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
  Write-Host "[ERR] Please run this script as administrator`n" -ForegroundColor Red
  Read-Host  "Press any key to continue"
  exit
}

# Check to make sure host is supported
Write-Host "[+] Checking to make sure Operating System is compatible"
if (-Not (((Get-WmiObject -class Win32_OperatingSystem).Version -eq "6.1.7601") -or ([System.Environment]::OSVersion.Version.Major -eq 10))){
  Write-Host "`t[ERR] $((Get-WmiObject -class Win32_OperatingSystem).Caption) is not supported, please use Windows 7 Service Pack 1 or Windows 10" -ForegroundColor Red
  exit
} else {
  Write-Host "`t$((Get-WmiObject -class Win32_OperatingSystem).Caption) supported" -ForegroundColor Green
}



# Attempt to disable Windows Defender
Write-Host "[+] Attemptting to disable Windows Defender 1.."
try {
  Get-Service WinDefend | Stop-Service -Force
  Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\services\WinDefend" -Name "Start" -Value 4 -Type DWORD -Force
} catch {
  Write-Warning "Failed to disable WinDefend service"
}

Write-Host "[+] Attemptting to disable Windows Defender 2.."
try {
  New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft' -Name "Windows Defender" -Force -ea 0 | Out-Null
  New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value 1 -PropertyType DWORD -Force -ea 0 | Out-Null
  New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableRoutinelyTakingAction" -Value 1 -PropertyType DWORD -Force -ea 0 | Out-Null
  New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name "SpyNetReporting" -Value 0 -PropertyType DWORD -Force -ea 0 | Out-Null
  New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name "SubmitSamplesConsent" -Value 0 -PropertyType DWORD -Force -ea 0 | Out-Null
  New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\MRT" -Name "DontReportInfectionInformation" -Value 1 -PropertyType DWORD -Force -ea 0 | Out-Null
  if (-Not ((Get-WmiObject -class Win32_OperatingSystem).Version -eq "6.1.7601")) {
    Add-MpPreference -ExclusionPath "C:\" -Force -ea 0 | Out-Null
    Set-MpPreference -DisableArchiveScanning $true  -ea 0 | Out-Null
    Set-MpPreference -DisableBehaviorMonitoring $true -Force -ea 0 | Out-Null
    Set-MpPreference -DisableBlockAtFirstSeen $true -Force -ea 0 | Out-Null
    Set-MpPreference -DisableCatchupFullScan $true -Force -ea 0 | Out-Null
    Set-MpPreference -DisableCatchupQuickScan $true -Force -ea 0 | Out-Null
    Set-MpPreference -DisableIntrusionPreventionSystem $true  -Force -ea 0 | Out-Null
    Set-MpPreference -DisableIOAVProtection $true -Force -ea 0 | Out-Null
    Set-MpPreference -DisableRealtimeMonitoring $true -Force -ea 0 | Out-Null
    Set-MpPreference -DisableRemovableDriveScanning $true -Force -ea 0 | Out-Null
    Set-MpPreference -DisableRestorePoint $true -Force -ea 0 | Out-Null
    Set-MpPreference -DisableScanningMappedNetworkDrivesForFullScan $true -Force -ea 0 | Out-Null
    Set-MpPreference -DisableScanningNetworkFiles $true -Force -ea 0 | Out-Null
    Set-MpPreference -DisableScriptScanning $true -Force -ea 0 | Out-Null
    Set-MpPreference -EnableControlledFolderAccess Disabled -Force -ea 0 | Out-Null
    Set-MpPreference -EnableNetworkProtection AuditMode -Force -ea 0 | Out-Null
    Set-MpPreference -MAPSReporting Disabled -Force -ea 0 | Out-Null
    Set-MpPreference -SubmitSamplesConsent NeverSend -Force -ea 0 | Out-Null
    Set-MpPreference -PUAProtection Disabled -Force -ea 0 | Out-Null
  }
} catch {
  Write-Warning "Failed to disable Windows Defender"
}




# Attempt to Set Environment Variable
Write-Host "[+] Attemptting to Set Environment Variable.."
$env:SCOOP='E:\Applications\Scoop'
$env:SCOOP_GLOBAL='E:\GlobalScoopApps'
[Environment]::SetEnvironmentVariable('SCOOP_GLOBAL', $env:SCOOP_GLOBAL, 'Machine')

# Attempt to download scoop isntall script to scoop.ps1
Write-Host "[+] Attemptting to download scoop isntall script to scoop.ps1.."
$DownResult = ""
do
{
  try {
    iwr get.scoop.sh -outfile 'scoop.ps1'
	$DownResult = "succ"
  } catch {
  Write-Warning "Failed to download scoop.ps1"
  $DownResult = "fail"
  }
}
while ($DownResult -ne "succ")

# Attempt to isntall scoop use of scoop.ps1
Write-Host "[+] Attemptting to install scoop.."
.\scoop.ps1 -RunAsAdmin
#iwr get.scoop.sh | iex
#IEX (New-Object Net.WebClient).DownloadString('https://github.com/zzhaq/scoop-av/Scoop.ps1')
