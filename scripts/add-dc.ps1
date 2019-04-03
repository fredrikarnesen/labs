
Add-WindowsFeature AD-Domain-Services
# Install-ADDSDomainController -CreateDnsDelegation:$false -DatabasePath 'E:\Windows\NTDS' -DomainName 'contoso.com' -InstallDns:$true -LogPath 'E:\Windows\NTDS' -NoGlobalCatalog:$false -SiteName 'Default-First-Site-Name' -SysvolPath 'C:\Windows\SYSVOL' -NoRebootOnCompletion:$true -Force:$true

$domain = 'contoso.com'
$user = 'faradmin'
$kv = 'kv-weu-fartest'
$password = (Get-AzKeyVaultSecret -vaultName $kv -name "DomainAdmin").SecretValueText
Start-Sleep -Seconds 120
$user = "$domain\$user"
$objCred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList ($user, $smPassword)
Add-Computer -DomainName "$domain" -Credential $objCred -Restart -Force