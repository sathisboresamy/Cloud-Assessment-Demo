output "rsg_name" {
  value       = azurerm_resource_group.demorsg.name
  description = "Resource group name"
}

output "rsg_location" {
  value       = azurerm_resource_group.demorsg.location
  description = "Resource group location"
}

output "rsg_id" {
  value       = azurerm_resource_group.demorsg.id
  description = "Resource group id"
}
