output "vnet_name" {
  value       = azurerm_virtual_network.demovnet.name
  description = "virtual network name"
}

output "vnet_id" {
  value       = azurerm_virtual_network.demovnet.id
  description = "virtual network nameid"
}
