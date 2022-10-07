output "vm_name" {
  value       = azurerm_windows_virtual_machine.dmowep-win2016.name
  description = "Virtual machine name"
}

output "vms_id" {
  value       = azurerm_windows_virtual_machine.dmowep-win2016.id
  description = "Virtual machine id"
}

output "public_ip" {
  value = azurerm_public_ip.public_ip.id
  description = "public ip address for the VM to use to connect web services & RDP"
  }