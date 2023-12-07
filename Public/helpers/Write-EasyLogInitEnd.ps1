function Write-EasyLogInitEnd {
<#
    .SYNOPSIS
    Function to initilize last line of log file.

    .DESCRIPTION
    This function will write the last line of the log file for the script run.

    .EXAMPLE
    Write-EasyLogInitEnd

#>
    Add-content $EasyLogFile -value "$(Get-EasylogTimeStamp) -----------------------------Logging End : $EasyLogdescription"
}