# EasyLog

## Synopsis

## Description
This module is a simple logger created for the use with RMMs
## Getting Started

### Prerequisites

### Installation

```powershell
$githubrepo  = "jayrodksmith/EasyLog"
$easylogrepo = "https://github.com/$githubrepo"
$releases = "https://api.github.com/repos/$githubrepo/releases"
$easyloglatestversion = (Invoke-WebRequest $releases | ConvertFrom-Json)[0].tag_name
$easylogExtractionPath = (Join-Path -Path "C:\Program Files\WindowsPowerShell\Modules\EasyLog" -ChildPath $easyloglatestversion)
$easylogDownloadZip = ('{0}/archive/main.zip' -f $easylogrepo)
$easylogDownloadFile = ('{0}\easylog.zip' -f $ENV:Temp)
# Create the niaupdater folder if it doesn't exist 
    if (-not (Test-Path -Path $easylogExtractionPath)) {
        $null = New-Item -Path $easylogExtractionPath -ItemType Directory -Force
    } else {
        $null = Remove-Item -Recurse -Force -Path $easylogExtractionPath
        $null = New-Item -Path $easylogExtractionPath -ItemType Directory -Force
    }
Invoke-WebRequest -Uri $easylogDownloadZip -OutFile $easylogDownloadFile
Expand-Archive -Path $easylogDownloadFile -DestinationPath $ENV:Temp -Force
Copy-Item -Path "$ENV:Temp\EasyLog-main\*" -Destination $easylogExtractionPath -Recurse -Force
Remove-Item -Path $easylogDownloadFile -Force
Remove-Item -Path "$ENV:Temp\EasyLog-main" -Recurse -Force
```

### Quick start
Starting a Log

```powershell
Start-EasyLog -EasyLogFile 'C:\ProgramData\EasyLog\TestLog.log' -EasyLogRMM 'None' -EasyLogDescription 'TestName'
```
Writing a Log

```powershell
Write-EasyLog -Message "Test Message" -Messagetype 'Silent'
```
Writing a Log Error

```powershell
Write-EasyLogError -Message "Test Message" -Messagetype 'Verbose'
```
Writing a Log Warning

```powershell
Write-EasyLogWarning -Message "Test Message" -Messagetype 'Silent'
```
Stopping a Log

```powershell
Stop-EasyLog -Message "Test Message" -Messagetype 'Silent'
```
Clearing log retention

```powershell
Clear-EasyLog -Retention 30
```
## Author
Jared Smith