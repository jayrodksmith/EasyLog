function Write-EasyLogError {
<#
    .SYNOPSIS
    Function to Write a log file.

    .DESCRIPTION
    This function will write a Error message log file.

    .EXAMPLE
    Write-EasyLog -Message "Test Message" -Messagetype 'Verbose'


    .PARAMETER Message
    The message details for the log to write with

    .PARAMETER Messagetype
    The message type when writing log to screen

#>
    param (
        $Message,
        [ValidateSet('Verbose','Debug','Silent')]
        [string]$messagetype = 'Verbose'
    )
        # Set NewLine Variable
        $nl = [System.Environment]::NewLine
        $ErrorCount += 1
        $Output += "$(Get-EasylogTimeStamp) - Error : $Message"+$nl
        Add-content $EasyLogFile -value "$(Get-EasylogTimeStamp) - Error : $message"
        if($messagetype -eq 'Verbose'){
            Write-Warning "$Message"
        }elseif($messagetype -eq 'Debug'){
            Write-Debug "$Message"
        }
}