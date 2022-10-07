# Install IIS Web Services and Puch the Code
resource "azurerm_virtual_machine_extension" "vm_extension" {
  name                       = "iisandcodedeploy"
  virtual_machine_id         = var.vm_id
  publisher                  = "Microsoft.Compute"
  type                       = "CustomScriptExtension"
  type_handler_version       = "1.10"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
            
    {
        "fileUris":["https://dmowepsta.blob.core.windows.net/data/IISandCodePush.ps1"] ,
        "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File IISandCodePush.ps1"
    }
 SETTINGS
}





