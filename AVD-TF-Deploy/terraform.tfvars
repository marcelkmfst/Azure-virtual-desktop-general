
# Customized the sample values below for your environment and either rename to terraform.tfvars or env.auto.tfvars

deploy_location                  = "west europe"
resource_group_name              = "Rg-pxcube-avd-by-tf"
prefix                           = "avdtf"
local_admin_username             = "mkadmin"
local_admin_password             = "Password123!"
resource_group_management_name   = "kpmg-avd-pxcube-mgmt-by-tf"
vnet_range                       = ["10.0.0.0/16"]
subnet_range_subnet_range_aadds  = ["10.0.100.0/24"]
subnet_range_AzureFirewallSubnet = ["10.0.250.0/24"]
subnet_range_sessionhosts        = ["10.0.1.0/24"]
subnet_range_privateendpoints    = ["10.0.50.0/24"]
dns_servers                      = ["10.0.100.4", "10.0.100.5"]
aad_group_name                   = "PXCube-AVDusers"
domain_name                      = "azlab101.com"
domain_user_upn                  = "addomainjoin@azlab101.com" # do not include domain name as this is appended
domain_password                  = "Pfarrer123!"
ad_rg                            = "infra-rg"
avd_users = [
  "avduser01@infra.local",
  "avduser01@infra.local"
]