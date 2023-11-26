function Get-EasylogTimeStamp() {
    param(
        [Parameter(Mandatory = $false)]
		[String]$format = $datetimeformat
    )
    return (Get-Date).ToString($format)
}