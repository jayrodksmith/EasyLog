function Write-EasyLogInitStart {
    Add-content $EasyLogFile -value "$(Get-EasylogTimeStamp) -----------------------------Logging Start : $EasyLogdescription"
}