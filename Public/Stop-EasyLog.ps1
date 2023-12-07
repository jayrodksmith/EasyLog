function Stop-EasyLog {
<#
    .SYNOPSIS
    Function to Stop a log file.

    .DESCRIPTION
    This function will stop the current log file.

    .EXAMPLE
    Stop-EasyLog -Message "Test Message" -Messagetype 'Silent'


    .PARAMETER Message
    The message details for the log to write with

    .PARAMETER Messagetype
    The message type when writing log to screen

#>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory = $false)]
        $Message,
        [ValidateSet('Verbose','Debug','Silent')]
        [Parameter(Mandatory = $false)]
        [string]$messagetype = 'Silent'
    )
    # Set NewLine Variable
    $nl = [System.Environment]::NewLine
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