function Start-EasyLog {
<#
    .SYNOPSIS
    Function to Start EasyLog

    .DESCRIPTION
    This function will start EasyLog for the current script

    .EXAMPLE
    Start-EasyLog -EasyLogFile 'C:\ProgramData\EasyLog\EasyLog.log' -EasyLogRMM 'None -EasyLogDescription 'Easylog'


    .PARAMETER EasyLogFile
    The location of the logfile

    .PARAMETER EasyLogRMM
    Choose to enable RMM support or not

    .PARAMETER EasyLogDescription
    Description of log file put into first line

    .PARAMETER Datetimeformat
    Date format to use for log file

    .PARAMETER EasyLogRetention
    Retention of logfile defaulted to 30 days
#>
    [CmdletBinding(SupportsShouldProcess)]
    param(
		[Parameter(Mandatory = $false)]
		[String]$EasyLogFile='C:\ProgramData\EasyLog\EasyLog.log',
        [Parameter(Mandatory = $false)]
        [ValidateSet('NinjaRMM', 'None')]
		[String]$EasyLogRMM='None',
        [Parameter(Mandatory = $false)]
		[String]$EasyLogDescription='EasyLog',
        [Parameter(Mandatory = $false)]
		[String]$datetimeformat='dd-MM-yyyy HH:mm:ss',
        [Parameter(Mandatory = $false)]
		[String]$EasyLogRetention='30'
	)

    # Set Easylog Variable and create folder if not exist
    if($EasyLogFile){
        Set-Variable EasyLogFile -Value $EasyLogFile -Scope Global -option ReadOnly -Force
        $folderPath = Split-Path -Path $EasyLogFile -Parent
        if (-not (Test-Path -Path $folderPath -PathType Container)) {
            New-Item -Path $folderPath -ItemType Directory -Force
        }
    }

    if($EasyLogRMM){
        Set-Variable EasyLogRMM -Value $EasyLogRMM -Scope Global -option ReadOnly -Force
    }

    if($EasyLogDescription){
        Set-Variable EasyLogDescription -Value $EasyLogDescription -Scope Global -option ReadOnly -Force
    }
    # Set Retention Variable
    Set-Variable EasyLogRetention -Value $EasyLogRetention -Scope Global -option ReadOnly -Force
    # Set DateTime Variable
    Set-Variable datetimeformat -Value $datetimeformat -Scope Global -option ReadOnly -Force
    # Set Error Count Null
    Set-Variable ErrorCount -Value 0 -Scope Global
    # Set Output Variable Null
    Set-Variable Output -Value '' -Scope Global
    Write-EasyLogInitStart
}