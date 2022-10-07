variable "vmname1" {
  type        = string
  default     = "dmowep-win2016"
  description = "Name of the Virtual Machine"
}
variable "size" {
  type        = string
  default     = "Standard_B2s"
  description = "Name of the VM Size"
}
variable "publishertype" {
  type        = string
  default     = "MicrosoftWindowsServer"
  description = "Name of the Publisher Type"
}
variable "offer" {
  type        = string
  default     = "WindowsServer"
  description = "Name of the Offer"
}
variable "sku" {
  type        = string
  default     = "2016-Datacenter"
  description = "Name of the VM SKU"
}
variable "Windowsversion" {

  type        = string
  default     = "latest"
  description = "Name of the Windows Version"

}
variable "admin_username" {
  type        = string
  default     = "adminuser"
  description = "Name of the VM Users Account"
}
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Name of the Location"
}
variable "subnet_id" {
  type        = string
  description = "Name of the Subnet"
}

variable "network_interface_ids" {
  type        = string
  default     = "dmowep-win2016-nic"
  description = "Name of the Storage account"
}

variable "vm_pipname" {
  type        = string
  default     = "vm_public_ip"
  description = "Name of Public IP Address"
}

variable "storage_account_type" {
  type        = string
  default     = "Standard_LRS"
  description = "Name of the Storage account Type"

}

variable "storage_name" {
  type        = string
  default     = "dmowepbootdiagsta"
  description = "Name of the Storage account"
}

variable "sta_name" {
  type        = string
  default     = "dmowepdmosta"
  description = "Name of the Storage account"

}

variable "keyvault_rsg" {
  type        = string
  description = "Name of the keyvault resource group"
  default     = "demo-dns-rsg"
}

variable "keyvault_name" {

  type        = string
  description = "Name of the resource group"
  default     = "dmowep-key-vlt"
}
variable "encrypt_operation" {

  description = "Enable Encryption for VM Disks"
  default     = "EnableEncryption"
}

locals {

  vmtags = {
    environment  = "Demo"
    servertype   = "Web Server"
    servicetype  = "Web Service"
    ostype       = "Windows Server 2016"
    ownername    = "Sathis Boresamy"
    emailaddress = "bsathis@demoazure.com"
    costcenter   = "Demo12345"
  }
}
locals {

  bootstatags = {
    name         = "Storage Account"
    servicetype  = "VM Boot Diagnostics"
    environment  = "Demo"
    ownername    = "Sathis Boresamy"
    emailaddress = "bsathis@demoazure.com"
    costcenter   = "Demo12345"
  }
}
locals {

  dmostatags = {
    name         = "Storage Account"
    servicetype  = "Blob Service"
    environment  = "Demo"
    ownername    = "Sathis Boresamy"
    emailaddress = "bsathis@demoazure.com"
    costcenter   = "Demo12345"
  }
}
locals {

  nictags = {
    name         = "dmowep-win2016"
    servicetype  = "VM NIC"
    environment  = "Demo"
    ownername    = "Sathis Boresamy"
    emailaddress = "bsathis@demoazure.com"
    costcenter   = "Demo12345"
  }
}
locals {

  piptags = {
    name         = "Public IP"
    servicetype  = "External"
    environment  = "Demo"
    ownername    = "Sathis Boresamy"
    emailaddress = "bsathis@demoazure.com"
    costcenter   = "Demo12345"
  }
}