
Add-WindowsFeature AD-Domain-Services
Install-ADDSDomainController -CreateDnsDelegation:$false -DatabasePath 'E:\Windows\NTDS' -DomainName 'contoso.com' -InstallDns:$true -LogPath 'E:\Windows\NTDS' -NoGlobalCatalog:$false -SiteName 'Default-First-Site-Name' -SysvolPath 'C:\Windows\SYSVOL' -NoRebootOnCompletion:$true -Force:$true









    
param($domain, $user, $password)

$domain = 'contoso.com'
$user = 'faradmin'
$password = 'Sommeren2019?'

$secret = Set-AzKeyVaultSecret -VaultName 'ContosoKeyVault' -Name 'ExamplePassword' -SecretValue $secretvalue

Start-Sleep -Seconds 120
$smPassword = (ConvertTo-SecureString $password -AsPlainText -Force)
$user = "$domain\$user"
$objCred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList ($user, $smPassword)
Add-Computer -DomainName "$domain" -Credential $objCred -Restart -Force