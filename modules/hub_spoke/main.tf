//Module for creating hub and spoke


//Iterating over data structures to create virtual networks
resource "azurerm_virtual_network" "vnets" {
  for_each            = var.vnets
  name                = each.value["name"]
  location            = each.value["location"]
  resource_group_name = each.value["resource_group_name"]
  address_space       = each.value["address_space"]
  //Lookup function makes things optional!
  dns_servers = lookup(each.value, "dns_servers", null)

  //Dynamic block for subnets
  dynamic "subnet" {
    for_each = each.value["subnets"]
    content {
      name           = subnet.value["name"]
      address_prefix = subnet.value["address_prefix"]
      security_group = lookup(subnet.value, "security_group", null)
    }
  }
}

//Peer virtual networks together to create hub and spoke
resource "azurerm_virtual_network_peering" "peers" {
  for_each                    = var.peers
  name                        = each.value["name"]
  resource_group_name         = each.value["rg_name"]
  virtual_network_name        = each.value["vnet_name"]
  remote_virtual_network_id   = each.value["remote_vnet_id"]
  allow_virtual_network_access = lookup(each.value, "allow_virtual_network_access", false)
  allow_forwarded_traffic     = lookup(each.value, "allow_forwarded_traffic", false)
  allow_gateway_transit       = lookup(each.value, "allow_gateway_transit", false)
  use_remote_gateways         = lookup(each.value, "use_remote_gateways", false)
  depends_on = [
    azurerm_virtual_network.vnets
  ]
}