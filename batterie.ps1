$battery = Get-WmiObject -Class Win32_Battery

Write-Host "Ladung:    $($battery.EstimatedChargeRemaining)%"
Write-Host "Status:    $(if ($battery.BatteryStatus -eq 2) { 'Wird geladen' } else { 'Nicht geladen' })"
Write-Host "Restzeit:  $($battery.EstimatedRunTime) Minuten"