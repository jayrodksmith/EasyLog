function Write-EasyLogInitEnd {
    Add-content $EasyLogFile -value "$(Get-EasylogTimeStamp) -----------------------------Logging End : $EasyLogdescription"
}