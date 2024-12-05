$domain = "www.internetbadguys.com"
$nslookupResult = nslookup $domain

# Output the results of nslookup
Write-Output "NSLookup results for ${domain}:"
Write-Output $nslookupResult

# Prevent the PowerShell window from closing immediately
Read-Host -Prompt "Press Enter to exit"
