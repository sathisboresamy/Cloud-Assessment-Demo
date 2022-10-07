# Create Virtual Network with address sapce

resource "azurerm_virtual_network" "demovnet" {
  name                = var.virtual_network_name
  address_space       = var.virtual_address_space
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = local.vnettags
}
