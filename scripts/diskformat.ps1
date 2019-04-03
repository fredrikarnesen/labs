Get-Disk -FriendlyName 'Msft Virtual Disk'|
Where-Object partitionstyle -eq 'raw' |
Initialize-Disk -PartitionStyle GPT -PassThru |
New-Partition -AssignDriveLetter -UseMaximumSize |
Format-Volume -FileSystem NTFS -AllocationUnitSize 65536 -NewFileSystemLabel "ADDS" -Confirm:$false