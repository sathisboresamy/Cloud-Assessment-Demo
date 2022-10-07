variable "network_security_group" {
  type        = string
  default     = "dmowep-demo-nsg"
  description = "Name of the security group"
}
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}
variable "location" {
  type        = string
  description = "Name of the location"
}
variable "subnet_id" {
  type        = string
  description = "Subnet id value to associate NSG"
}
variable "security_id" {
  type        = string
  description = "network security group id"
}
locals {
  nsgrules = {

    https = {
      name                       = "Secured-HTTPS"
      priority                   = 101
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }

    RDP = {
      name                       = "RDP"
      priority                   = 102
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }

  }
}
locals {

    sectags = {
      environment               = "Demo"
      NSGName                   = "dmowep-demo-nsg"
      servicetype               = "Firewall Service"
      ownername                 = "Sathis Boresamy"
      emailaddress              = "bsathis@demoazure.com"
      costcenter                = "Demo12345"
  }
}