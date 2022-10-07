# Create Subnet in Virtual Network to deploy Virtual Machines
resource "azurerm_subnet" "demosbt" {
  name                 = var.subnet_name
  address_prefixes     = var.address_prefixes
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}