  variable "group_name" {
    type = string 
  default = "dmowep-dmo-rsg"
  description = "Name of the resource group"
  }
  variable "location" {
    type = string
    default = "westeurope"
    description = "Name of the location for resource group creation"
  }
   locals {
    
    rsgtags = {
    environment = "Demo"
    Name = "dmowep-demo-rsg"
    servicetype = "Resource Group"
    ownername = "Sathis Boresamy"
    emailaddress = "bsathis@demoazure.com"
    costcenter = "Demo12345"
    }
  }