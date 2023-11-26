function Start-EasyLog {
    param(
		[Parameter(Mandatory = $false)]
		[String]$EasyLogFile='C:\ProgramData\EasyLog\EasyLog.log',
        [Parameter(Mandatory = $false)]
        [ValidateSet('NinjaRMM', 'None')]
		[String]$EasyLogRMM='None',
        [ValidateSet('NinjaRMM', 'None')]
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
    # Set NewLine Variable
    Set-Variable nl -Value "[System.Environment]::NewLine" -Scope Global -option ReadOnly -Force
    # Set Error Count Null
    Set-Variable ErrorCount -Value 0 -Scope Global
    # Set Output Variable Null
    Set-Variable Output -Value '' -Scope Global
    Write-EasyLogInitStart
}

