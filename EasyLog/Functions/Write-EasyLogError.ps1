function Write-EasyLogError {
    param (
        $Message,
        [ValidateSet('Verbose','Debug','Silent')]
        [string]$messagetype = 'Verbose'
    )
        $ErrorCount += 1
        $Output += "$(Get-EasylogTimeStamp) - Error : $Message"+$nl
        Add-content $EasyLogFullPath -value "$(Get-EasylogTimeStamp) - Error : $message"
        if($messagetype -eq 'Verbose'){
            Write-Warning "$Message"
        }elseif($messagetype -eq 'Debug'){
            Write-Debug "$Message"
        }
}