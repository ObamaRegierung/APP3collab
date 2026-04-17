# System Uptime Checker

$uptime = (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime
$now = Get-Date
$uptimeDuration = $now - $uptime

Write-Host "System Uptime:" -ForegroundColor Cyan
Write-Host "Last Boot: $($uptime.ToString('yyyy-MM-dd HH:mm:ss'))" -ForegroundColor Green
Write-Host "Uptime: $($uptimeDuration.Days) days, $($uptimeDuration.Hours) hours, $($uptimeDuration.Minutes) minutes" -ForegroundColor Yellow