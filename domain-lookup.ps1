$domain = "www.internetbadguys.com"
$nslookupResult = nslookup $domain

# Output the results of nslookup
Write-Output "NSLookup results for $domain:"
Write-Output $nslookupResult
