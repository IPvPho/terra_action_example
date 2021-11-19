provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {}

  alias = "labs"
  subscription_id = var.lab_sub_id
}

//Call local submodule for resource groups
module "rgs" {
  source = "./modules/rg"
  rgs = var.rgs
}

//Call local module for hub and spoke
module "hub_spoke" {
  source = "./modules/hub_spoke"
  vnets = var.vnets
  peers = var.peers
  depends_on = [
    module.rgs
  ]
}

module "storage" {
  providers = {
    azurerm.strgaccnttarget = azurerm.labs
  }
  source      = "github.com/johhess40/Terraform/azure/modules/storage/basestrg"
  stgaccounts = var.stgaccounts
  containers  = var.containers
  depends_on = [
    module.rgs
  ]
}
