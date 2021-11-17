//Module for creating resource groups

//Iterating over data structures to create resource groups
resource "azurerm_resource_group" "rgs" {
  for_each = var.rgs
  name     = each.value["name"]
  location = each.value["location"]
  tags     = lookup(each.value, "tags", null)
}