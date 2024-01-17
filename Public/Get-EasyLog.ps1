function Get-EasyLog {
    <#
        .SYNOPSIS
        Function to Get current easy log file lines
    
        .DESCRIPTION
        This function will get EasyLog lines for the current script and print for easier reading
    
        .EXAMPLE
        Get-EasyLog
    
        .PARAMETER EasyLogFile
        The location of the logfile

        .PARAMETER EasyLogLines
        The amount of lines the function will retrieve
    #>
        [CmdletBinding(SupportsShouldProcess)]
        param(
            [Parameter(Mandatory = $false)]
            [String]$EasyLogFile=$EasyLogFile,
            [Parameter(Mandatory = $false)]
            [String]$EasyLogLines='30'
        )
        function Get-LastLines {
            param(
                [string]$EasyLogFile,
                [int]$EasyLogLines
            )
        
            try {
                $lines = Get-Content -Path $EasyLogFile -Tail $EasyLogLines
        
                foreach ($line in $lines) {
                    if ($line -match "Error") {
                        Write-Host $line -ForegroundColor Red
                    }
                    elseif ($line -match "Warning") {
                        Write-Host $line -ForegroundColor DarkYellow
                    }
                    elseif ($line -match "Exit") {
                        Write-Host $line -ForegroundColor Yellow
                    }
                    else {
                        Write-Host $line
                    }
                }
            }
            catch {
                Write-Host "An error occurred: $_" -ForegroundColor Red
            }
        }
        $lastLines = Get-LastLines -EasyLogFile $EasyLogFile -EasyLogLines $EasyLogLines
        if ($lastLines -is [System.Array]) {
            foreach ($line in $lastLines) {
                Write-Output $line.Trim()
            }
        } else {
            Write-Output $lastLines
        }

    }