terraform {
  backend "azurerm" {
    resource_group_name  = "demo-dns-rsg"
    storage_account_name = "dmowepsta"
    container_name       = "terrafromstate"
    key                  = "dmo.terraform.tfstate"
  }
}