$user = "faradmin"
$domain = "contoso.com"
$kv = 'kv-weu-fartest'
$password = 'Sommeren2019?'
# $password = (Get-AzKeyVaultSecret -vaultName $kv -name "DomainAdmin").SecretValueText
$smPassword = (ConvertTo-SecureString $password -AsPlainText -Force)
$cred = new-object -typename System.Management.Automation.PSCredential `
         -argumentlist $user, $smPassword

Install-WindowsFeature -Name "AD-Domain-Services" `
                       -IncludeManagementTools `
                       -IncludeAllSubFeature 

Install-ADDSDomainController -DomainName $domain `
                             -NoGlobalCatalog:$false `
                             -CreateDnsDelegation:$false `
                             -Credential $cred `
                             -CriticalReplicationOnly:$false `
                             -DatabasePath "E:\Windows\NTDS" `
                             -InstallDns:$true `
                             -LogPath "E:\Windows\NTDS" `
                             -NoRebootOnCompletion:$false `
                             -SiteName "Default-First-Site-Name" `
                             -SysvolPath "E:\Windows\SYSVOL" `
                             -Force:$true `
                             -SafeModeAdministratorPassword $smPassword