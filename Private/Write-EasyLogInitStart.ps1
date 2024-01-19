function Write-EasyLogInitStart {
<#
    .SYNOPSIS
    Function to initilize first line of log file.

    .DESCRIPTION
    This function will write the first line of the log file for the script run.

    .EXAMPLE
    Write-EasyLogInitStart

#>
    Add-content $EasyLogFile -value "$(Get-EasylogTimeStamp) -----------------------------Logging Start : $EasyLogdescription"
}