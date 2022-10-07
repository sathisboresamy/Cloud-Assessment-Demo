variable "subnet_name" {
  type    = string
  default = "dmowep-dmo-sbt1"
  description = "Name of the subnet"
}
variable "address_prefixes" {
  type    = list(string)
  default = ["10.1.0.0/25"]
  description = "Subnet address range"
}
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "virtual_network_name" {
  type        = string
  description = "virtual network name"
}