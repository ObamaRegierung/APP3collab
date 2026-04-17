. './Write-Log.ps1'

$path = "C:\Users\JeKu-Lab\Documents\writelog"

try {# System Uptime Checker

$uptime = (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime
$now = Get-Datex
$uptimeDuration = $now - $uptime

Write-Host "System Uptime:" -ForegroundColor Cyan
Write-Host "Last Boot: $($uptime.ToString('yyyy-MM-dd HH:mm:ss'))" -ForegroundColor Green
Write-Host "Uptime: $($uptimeDuration.Days) days, $($uptimeDuration.Hours) hours, $($uptimeDuration.Minutes) minutes" -ForegroundColor Yellow
} 

catch {
    Write-Log -LogFile "./testlog.log" -Message "Geht nicht" -Severity Error 
}
