param(
    [Parameter(Mandatory=$true)]
    [string]$domain
)

Write-Host "Looking up DNS for: $domain"
Write-Host "--------------------------------"

try {
    $dnsResult = Resolve-DnsName $domain -ErrorAction Stop
    $dnsResult | Where-Object { $_.Type -eq 'A' } | ForEach-Object {
        Write-Host "IP Address: $($_.IPAddress)"
    }
    if (-not ($dnsResult | Where-Object { $_.Type -eq 'A' })) {
        Write-Host "No A records found."
    }
} catch {
    Write-Host "Error: Unable to resolve DNS for $domain. $($_.Exception.Message)"
}