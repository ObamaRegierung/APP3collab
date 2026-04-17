function Write-Log {

    [CmdletBinding()]

    Param ( [Parameter(Mandatory = $true)]

    [String]$LogFile,

    [Parameter(Mandatory = $true)]

    [String]$Message,

    [Parameter(Mandatory = $true)]

    [ValidateSet("Error", "Warning", "Info", "Debug")]

    [String]$Severity )

   

    (Get-Date -f yyyy-MM-dd" "HH:mm:ss.fff) + "`t$Severity `t$Message " | Out-File $LogFile -Append

}


