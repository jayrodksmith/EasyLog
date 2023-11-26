function Write-EasyLog {
    param (
        $Message,
        [ValidateSet('Verbose','Debug','Silent')]
        [string]$messagetype = 'Silent'
    )
        $Output += "$(Get-EasylogTimeStamp) - Msg   : $Message"+$nl
        Add-content $EasyLogFile -value "$(Get-EasylogTimeStamp) - Msg   : $message"
        if($messagetype -eq 'Verbose'){
            Write-Output "$Message"
        }elseif($messagetype -eq 'Debug'){
            Write-Debug "$Message"
        }
}