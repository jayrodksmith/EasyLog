function Write-EasyLog {
<#
    .SYNOPSIS
    Function to Write a log file.

    .DESCRIPTION
    This function will write a normal message log file.

    .EXAMPLE
    Write-EasyLog -Message "Test Message" -Messagetype 'Silent'


    .PARAMETER Message
    The message details for the log to write with

    .PARAMETER Messagetype
    The message type when writing log to screen

#>
    param (
        $Message,
        [ValidateSet('Verbose','Debug','Silent')]
        [string]$messagetype = 'Silent'
    )
        # Set NewLine Variable
        $nl = [System.Environment]::NewLine
        $Output += "$(Get-EasylogTimeStamp) - Msg   : $Message"+$nl
        Add-content $EasyLogFile -value "$(Get-EasylogTimeStamp) - Msg   : $message"
        if($messagetype -eq 'Verbose'){
            Write-Output "$Message"
        }elseif($messagetype -eq 'Debug'){
            Write-Debug "$Message"
        }
}