Write-Output("Geting Ips...")
$sites = @(//Enter your websites

)

$allIps = @()

foreach ($a in $sites) {
    $ips = (Resolve-DnsName $a -Type A -ErrorAction SilentlyContinue).IPAddress
    if ($ips) { 
        $allIps += $ips 
        Write-Output "Found $a"
    }
}

$allIps = $allIps | Select-Object -Unique
New-NetFirewallRule -DisplayName "Network stability script" -Direction Outbound -Action Block -Enabled True -LocalPort Any -Profile Any -RemoteAddress $allIps
