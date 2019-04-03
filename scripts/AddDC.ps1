$user = "faradmin"
$domain = "contoso.com"
$kv = 'kv-weu-fartest'
$password = (Get-AzKeyVaultSecret -vaultName $kv -name "DomainAdmin").SecretValueText
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
                             -DatabasePath "F:\Windows\NTDS" `
                             -InstallDns:$true `
                             -LogPath "F:\Windows\NTDS" `
                             -NoRebootOnCompletion:$false `
                             -SiteName "Default-First-Site-Name" `
                             -SysvolPath "F:\Windows\SYSVOL" `
                             -Force:$true `
                             -SafeModeAdministratorPassword $smPassword 