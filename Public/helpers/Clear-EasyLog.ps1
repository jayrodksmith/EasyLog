function Clear-EasyLog {
<#
    .SYNOPSIS
    Function to Clear EasyLog

    .DESCRIPTION
    This function will clear retention period set on log file

    .EXAMPLE
    Clear-EasyLog -Retention 30
    Clear-EasyLog

    .PARAMETER Retention
    Amount of days to cull from logfile
    Defaults to 30 days

#>
    param(
        [Parameter(Mandatory = $false)]
        [int]$Retention = $EasyLogRetention
    )
    $cutOffDate = (Get-Date).AddDays(-$Retention)
    $originalContent = Get-Content -Path $EasyLogFile
    $filteredLines  = $originalContent | Where-Object {
    if ($_ -match '^(\d{2}-\d{2}-\d{4} \d{2}:\d{2}:\d{2})') {
        $lineDate = [DateTime]::ParseExact($matches[1], $datetimeformat, $null)
        $lineDate -ge $cutOffDate
        } else {
            $true  # Include lines without a recognized date
        }
    }

    # Compare the original and updated content
    $contentComparison = Compare-Object -ReferenceObject $originalContent -DifferenceObject $filteredLines

    # Check if there are differences
    if (-not $contentComparison) {
        Write-Verbose "No log file retention required."
    } else {
        $filteredLines | Set-Content -Path $EasyLogFile
        Write-Verbose "Setting Retention on log file for any line older than "
    }
}