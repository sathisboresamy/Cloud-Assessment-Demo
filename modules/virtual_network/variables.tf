variable "virtual_network_name" {
  type        = string
  default     = "dmowep-dmo-vnet"
  description = "Name of the virtual network name"
}

variable "virtual_address_space" {
  type        = list(string)
  default     = ["10.1.0.0/16"]
  description = "Virtual network address space"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = " Azure Cloud location"
}
locals {

  vnettags = {
    environment  = "Demo"
    networktype  = "Demo Virtual Network"
    servicetype  = "Network Services"
    ownername    = "Sathis Boresamy"
    emailaddress = "bsathis@demoazure.com"
    costcenter   = "Demo12345"
  }
}