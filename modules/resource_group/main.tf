# Resource Group for Cloud resource deployment
resource "azurerm_resource_group" "demorsg"{
  name = var.group_name
  location = var.location
  tags = local.rsgtags
}