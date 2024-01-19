function Get-EasylogTimeStamp() {
<#
    .SYNOPSIS
    Function to get current date.

    .DESCRIPTION
    This function will get current date in format specified.

    .EXAMPLE
    Get-EasylogTimeStamp -format 'dd-MM-yyyy HH:mm:ss'


    .PARAMETER format
    The type of timestamp format

#>
    param(
        [Parameter(Mandatory = $false)]
		[String]$format = $datetimeformat
    )
    return (Get-Date).ToString($format)
}