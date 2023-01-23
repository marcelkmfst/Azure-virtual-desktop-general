$resourcegroup = "MK101-AVD-AAD"
$hostpool = "HPAADW11MS"
$SessionHostVMobjekts=(Get-AzVM -ResourceGroupName $resourcegroup)
$sessionHostVMs=$SessionHostVMobjekts.Name

foreach ($vm in $SessionHostVMs)

{
Set-AzVMCustomScriptExtension -ResourceGroupName $resourcegroup `
    -VMName $vm -Name "mk101shconfig" `
    -FileUri "https://raw.githubusercontent.com/marcelkmfst/avd-0365/main/AAD%20kerberos/registrykeys.ps1" `
    -Run "registrykeys.ps1" -Location "West Europe"
}