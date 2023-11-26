# Load all Functions
Get-childitem -Path "$PSScriptRoot\Functions" -Recurse -File -Filter '*.ps1' | ForEach-Object -Process {
  . $_.FullName
}
