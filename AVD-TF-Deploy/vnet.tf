resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_range
  dns_servers         = var.dns_servers
  location            = var.deploy_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet-aadds" {
  name                 = "SN-AADDS"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_range_aadds
}

resource "azurerm_subnet" "subnet-AzureFirewall" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_range_AzureFirewallSubnet
}

resource "azurerm_subnet" "subnet-sessionhosts" {
  name                 = "SN-Sessionhosts01"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_range_sessionhosts
}

resource "azurerm_subnet" "subnet-privateendpoints" {
  name                 = "SN-Privateendpoints"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_range_privateendpoints
}




# resource "azurerm_network_security_group" "nsg" {
#   name                = "${var.prefix}-NSG"
#   location            = var.deploy_location
#   resource_group_name = var.rg_name
#   security_rule {
#     name                       = "HTTPS"
#     priority                   = 1001
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "443"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
#   depends_on = [azurerm_resource_group.rg]
# }

# resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
#   subnet_id                 = azurerm_subnet.subnet.id
#   network_security_group_id = azurerm_network_security_group.nsg.id
# }

# data "azurerm_virtual_network" "ad_vnet_data" {
#   name                = var.ad_vnet
#   resource_group_name = var.ad_rg
# }

# resource "azurerm_virtual_network_peering" "peer1" {
#   name                      = "peer_avdspoke_ad"
#   resource_group_name       = var.rg_name
#   virtual_network_name      = azurerm_virtual_network.vnet.name
#   remote_virtual_network_id = data.azurerm_virtual_network.ad_vnet_data.id
# }
# resource "azurerm_virtual_network_peering" "peer2" {
#   name                      = "peer_ad_avdspoke"
#   resource_group_name       = var.ad_rg
#   virtual_network_name      = var.ad_vnet
#   remote_virtual_network_id = azurerm_virtual_network.vnet.id
# }