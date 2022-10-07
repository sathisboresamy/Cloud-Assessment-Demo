# Network Security Group, Rules Creation and Associate Subnets
resource "azurerm_network_security_group" "demonsg" {
  name                = var.network_security_group
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = local.sectags
}

resource "azurerm_subnet_network_security_group_association" "demosubasso" {

  subnet_id                 = var.subnet_id
  network_security_group_id = var.security_id
  
}


resource "azurerm_network_security_rule" "nsgrule" {

  for_each                    = local.nsgrules
  name                        = each.key
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.network_security_group
  depends_on                  = [azurerm_network_security_group.demonsg]
}