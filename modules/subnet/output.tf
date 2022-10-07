output "sbt_name" {
  value       = azurerm_subnet.demosbt.name
  description = "Subnet Name"
}

output "sbt_id" {
  value       = azurerm_subnet.demosbt.id
  description = "Subnet Name Id"
}

output "sbt_address" {
  value       = azurerm_subnet.demosbt.address_prefixes
  description = "Subnet Name Address "
}