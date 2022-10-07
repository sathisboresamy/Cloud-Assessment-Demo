# Modules for Resource Group, Virtual Network, Subnet, Security Group, Virtual Machine, Web service, Code Deployment

module "resource_group" {
  source = "./modules/resource_group"
}

module "virtual_network" {
  source              = "./modules/virtual_network"
  resource_group_name = module.resource_group.rsg_name
  location            = module.resource_group.rsg_location
  depends_on           = [module.resource_group]
}

module "subnet" {

  source               = "./modules/subnet"
  virtual_network_name = module.virtual_network.vnet_name
  resource_group_name  = module.resource_group.rsg_name
  depends_on           = [module.virtual_network]
}

module "security_group" {

  source              = "./modules/security_group"
  resource_group_name = module.resource_group.rsg_name
  location            = module.resource_group.rsg_location
  subnet_id           = module.subnet.sbt_id
  security_id         = module.security_group.sec_id
  depends_on          = [module.subnet]
}

module "virtual_machine" {

  source              = "./modules/virtual_machine"
  resource_group_name = module.resource_group.rsg_name
  location            = module.resource_group.rsg_location
  subnet_id           = module.subnet.sbt_id
  depends_on          = [module.subnet]
}

#resource "time_sleep" "wait_seconds1" {
 # create_duration = "120s"
#}
module "app_deployment" {

  source     = "./modules/app_code_deployment"
  vm_id      = module.virtual_machine.vms_id
  depends_on = [module.virtual_machine]
}