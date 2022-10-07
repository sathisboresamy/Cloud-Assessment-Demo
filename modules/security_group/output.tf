output "sec_name" {
  value       = azurerm_network_security_group.demonsg.name
  description = "Security Group Name"
}

output "sec_id" {
  value       = azurerm_network_security_group.demonsg.id
  description = "Security Group id"
}