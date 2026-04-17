. "./Write-Log.ps1" 

try {
    Add-Type AssemblyName System.Windows.Forms
    [System.Windows.Forms.MessageBox]::Show("Willkommen $env:USERNAME!", "Systemstart")
}
catch {
    write-host "Fehler aufgetreten"
}