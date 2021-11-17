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

// locals {
//   rg_ids = {for k,v in module.rgs.rgs: "${k}-id" => v.id}
//   rg_names = {for k,v in module.rgs.rgs: "${k}-name" => v.name}
//   list = [
//     {
//       value = "value one"
//     },
//     {
//       value = "value two"
//     },
//     {
//       value = "value three"
//     }
//   ]
//   list_values = {for v in local.list: "value is" => v.value...}
// }

// output "rg_ids" {
//   value = local.rg_ids
// }

// output "rg_names" {
//   value = local.rg_names
// }

// output "list_values" {
//   value = local.list_values
// }