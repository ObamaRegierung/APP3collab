. "./Write-Log.ps1" 

$path = "C:\"

try {
    if(Test-Path $path) {
        Write-Log -LogFile "./test-script.log" -Message "Pfad $Path existiert!" -Severity "Info"
    }
    else {
        throw
    }
}
catch {
    Write-Log -LogFile "./test-script.log" -Message "Pfad $Path existiert nicht!" -Severity "Error"
}