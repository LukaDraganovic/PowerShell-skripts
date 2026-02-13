Write-Output("Geting Ips...")
$sites = @(
"www.openai.com",
"openai.com",
"chatgpt.com",
"www.chatgpt.com",

"www.deepseek.com",
"deepseek.com",
"deep-seek.com",
"www.deep-seek.com",

"gemini.google.com",
"www.gemini.google.com",

"claude.ai",
"www.claude.ai",
"claude.com",
"www.claude.com",

"www.copilot.com",
"copilot.com",
"copilot.microsoft.com",
"www.copilot.microsoft.com",
"copilot.cloud.microsoft",
"www.copilot.cloud.microsoft",

"www.perplexity.ai",
"perplexity.ai",

"use.ai",
"www.use.ai",

"grok.com",
"www.grok.com",
"x.ai",
"www.x.ai",

"www.meta.ai",
"meta.ai",
"chaton.ai",
"www.chaton.ai" )

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