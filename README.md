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
$easylogDownloadZip = ('{0}/archive/main.zip' -f $niaupdaterRepo)
$easylogDownloadFile = ('{0}\easylog.zip' -f $ENV:Temp)
# Create the niaupdater folder if it doesn't exist 
    if (-not (Test-Path -Path $easylogExtractionPath)) {
        $null = New-Item -Path $easylogExtractionPath -ItemType Directory -Force
    } else {
        $null = Remove-Item -Recurse -Force -Path $easylogExtractionPath
        $null = New-Item -Path $easylogExtractionPath -ItemType Directory -Force
    }
Invoke-WebRequest -Uri $easylogDownloadZip -OutFile $easylogDownloadFile
Expand-Archive -Path $easylogDownloadFile -DestinationPath $easylogExtractionPath -Force
Remove-Item -Path $easylogDownloadFile -Force
```

### Quick start

## Author

Jared Smith

