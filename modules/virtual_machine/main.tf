# Use existing Azure Keyvault Secrets value to supply the password for VM creation and access

data "azurerm_key_vault" "keyvault" {

  name                = var.keyvault_name
  resource_group_name = var.keyvault_rsg
}

data "azurerm_key_vault_secret" "mySecret" {
  name         = "adminuser"
  key_vault_id = data.azurerm_key_vault.keyvault.id

}

# Create VM in Azure Cloud

resource "azurerm_windows_virtual_machine" "dmowep-win2016" {
  name                  = var.vmname1
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.size
  admin_username        = var.admin_username
  admin_password        = data.azurerm_key_vault_secret.mySecret.value
  network_interface_ids = [azurerm_network_interface.demonic.id]

  os_disk {
    name                 = var.vmname1
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type

  }

  source_image_reference {
    publisher = var.publishertype
    offer     = var.offer
    sku       = var.sku
    version   = var.Windowsversion
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.bootdiagsta.primary_blob_endpoint
  }

  tags = local.vmtags
}
resource "azurerm_network_interface" "demonic" {
  name                = var.network_interface_ids
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "democonfiguration1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id

  }
  tags = local.nictags

}

# Create Public IP for the VM to access WebSite from Internet

resource "azurerm_public_ip" "public_ip" {
  name                = var.vm_pipname
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
  tags                = local.piptags
}

# Create Storage acccount for VM Boot Diagnostics
resource "azurerm_storage_account" "bootdiagsta" {
  name                     = var.storage_name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  tags                     = local.bootstatags
  blob_properties {

    versioning_enabled = true
  }

   queue_properties  {
     logging {
         delete                = true
         read                  = true
         write                 = true
         version               = "1.0"
         retention_policy_days = 10
     }
   }
}

# Create Storage acccount with Versioning 

resource "azurerm_storage_account" "staforversion" {
  name                     = var.sta_name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  tags                     = local.dmostatags

  blob_properties {

    versioning_enabled = true
  }
  queue_properties  {
     logging {
         delete                = true
         read                  = true
         write                 = true
         version               = "1.0"
         retention_policy_days = 10
     }
   }
}

resource "azurerm_storage_container" "contain" {
  name                  = "demo"
  storage_account_name  = azurerm_storage_account.staforversion.name
  container_access_type = "private"
}

# Set Disk Encryption for VM Disk

resource "azurerm_virtual_machine_extension" "disk-encryption" {
  name                 = "DiskEncryption"
  virtual_machine_id   = azurerm_windows_virtual_machine.dmowep-win2016.id
  publisher            = "Microsoft.Azure.Security"
  type                 = "AzureDiskEncryption"
  type_handler_version = "2.2"

  settings = <<SETTINGS
{
   
  "EncryptionOperation": "${var.encrypt_operation}",
        "KeyVaultURL": "${data.azurerm_key_vault.keyvault.vault_uri}",
        "KeyVaultResourceId": "${data.azurerm_key_vault.keyvault.id}",                   
        "KeyEncryptionAlgorithm": "RSA-OAEP",
        "VolumeType": "All"
}
SETTINGS
  timeouts {
    create = "30m"
  }
}
