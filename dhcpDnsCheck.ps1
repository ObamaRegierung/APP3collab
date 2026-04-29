$services = @("DNS", "DHCPServer") # Namen der Windows-Dienste

foreach ($serviceName in $services) {
    try {
        $service = Get-Service -Name $serviceName -ErrorAction Stop
        
        if ($service.Status -ne "Running") {
            Write-Log -LogFile $logFile -Severity "Warning" -Message "Service $serviceName steht auf $($service.Status). Versuche Neustart..."
            Start-Service -Name $serviceName
            Write-Log -LogFile $logFile -Severity "Info" -Message "Service $serviceName wurde erfolgreich gestartet."
        } else {
            Write-Log -LogFile $logFile -Severity "Info" -Message "Service $serviceName läuft einwandfrei."
        }
    }
    catch {
        Write-Log -LogFile $logFile -Severity "Error" -Message "Fehler beim Check von $serviceName : $($_.Exception.Message)"
    }
}