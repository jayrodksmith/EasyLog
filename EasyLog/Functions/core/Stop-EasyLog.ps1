function Stop-EasyLog {  
    param(
        [Parameter(Mandatory = $false)]
        $Message,
        [ValidateSet('Verbose','Debug','Silent')]
        [Parameter(Mandatory = $false)]
        [string]$messagetype = 'Silent'
    )
    if($message){$Output += "$(Get-EasylogTimeStamp) - Exit   : $Message"+$nl}
    $Message = '----------'+$nl+"$(Get-EasylogTimeStamp) - Errors : $ErrorCount"
    $Output += "$(Get-EasylogTimeStamp) $Message"
    Add-content $EasyLogFile -value "$(Get-EasylogTimeStamp) - Exit  : $message"
    Add-content $EasyLogFile -value "$(Get-EasylogTimeStamp) -----------------------------Log End"
    if($messagetype -eq 'Verbose'){
        Write-Warning "Errors : $ErrorCount"
    }elseif($messagetype -eq 'Debug'){
        Write-Debug "Errors : $ErrorCount"
    }
    Clear-EasyLog
}
