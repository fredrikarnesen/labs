# Set NIC to Static IP address
# Ref https://docs.microsoft.com/en-us/powershell/module/azurerm.network/set-azurermnetworkinterfaceipconfig?view=azurermps-6.13.0

$RG = 'rg-bootcampholad'
$Loc = 'westeurope'

$nic = Get-AzNetworkInterface -ResourceGroupName "rg-bootcampholad" -Name "DC01853"
$Nic.IpConfigurations[0].PrivateIpAllocationMethod = "Static"
Set-AzNetworkInterface -NetworkInterface $Nic

$nic = Get-AzNetworkInterface -ResourceGroupName "rg-bootcampholad" -Name "DC02853"
$Nic.IpConfigurations[0].PrivateIpAllocationMethod = "Static"
Set-AzNetworkInterface -NetworkInterface $Nic

$nic = Get-AzNetworkInterface -ResourceGroupName "rg-bootcampholad" -Name "DC03845"
$Nic.IpConfigurations[0].PrivateIpAllocationMethod = "Static"
Set-AzNetworkInterface -NetworkInterface $Nic

# Enable Custom Script Extension
Set-AzVMCustomScriptExtension -ResourceGroupName $RG -Location $Loc -VMName "DC01" -Name "DC01" -TypeHandlerVersion "1.1" -StorageAccountName "Contoso" -StorageAccountKey <StorageKey> -FileName "ContosoScript.exe" -ContainerName "Scripts"