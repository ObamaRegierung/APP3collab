. "./Write-Log.ps1" 

try {
    $DNSService = Get-Service -Name "*DNS*"
    if ($DNSService.Status -ne "Running") {
        Write-Host "Der DNS-Dienst ist nicht aktiv."
        Start-Service -Name $DNSService.Name
        Write-Host "Der DNS-Dienst wurde gestartet."
        write-log -LogFile "./service-start.log" -Message "Der DNS-Dienst wurde gestartet." -Severity "Info"
    }
    else {
        Write-Host "Der DNS-Dienst ist bereits aktiv."
        write-log -LogFile "./service-start.log" -Message "Der DNS-Dienst ist bereits aktiv." -Severity "Info"
    }
}
catch {
    Write-Host "Fehler aufgetreten"
}