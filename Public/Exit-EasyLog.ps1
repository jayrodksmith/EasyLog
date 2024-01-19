function Exit-EasyLog {
<#
    .SYNOPSIS
    Function to Stop EasyLog with exit code

    .DESCRIPTION
    This function will stop EasyLog for the current script with a Exit code

    .EXAMPLE
    Exit-EasyLog -ExitCode 0
    Exit-EasyLog -Message 'Test' -Messagetype 'Silent' -ExitCode 0

    .PARAMETER Message
    The message details for the log to write with

    .PARAMETER Messagetype
    The message type when writing log to screen

    .PARAMETER ExitCode
    The exit code of the script 0 = success any other = failed

#>
    param(
        [Parameter(Mandatory = $false)]
        $Message,
        [ValidateSet('Verbose','Debug','Silent')]
        [Parameter(Mandatory = $false)]
        [string]$messagetype = 'Silent',
        [Parameter(Mandatory = $false)]
        [int]$ExitCode,
    )
    # Set NewLine Variable
    $nl = [System.Environment]::NewLine
    if($message){$Output += "$(Get-EasylogTimeStamp) - Exit   : $Message"+$nl}
    $Message = '----------'+$nl+"$(Get-EasylogTimeStamp) - Errors : $ErrorCount"
    $Output += "$(Get-EasylogTimeStamp) $Message"
    Add-content $EasyLogFile -value "$(Get-EasylogTimeStamp) - Exit  : $message Exit Code = $Exitcode"
    Add-content $EasyLogFile -value "$(Get-EasylogTimeStamp) -----------------------------Log End"
    if($messagetype -eq 'Verbose'){
        Write-Warning "Errors : $ErrorCount"
    }elseif($messagetype -eq 'Debug'){
        Write-Debug "Errors : $ErrorCount"
    }
    Clear-EasyLog
    if($ExitCode){
        Exit $ExitCode
    }
}