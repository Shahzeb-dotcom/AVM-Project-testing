module "resource_group" {
    for_each = var.rg_name
  source  = "Azure/avm-res-resources-resourcegroup/azurerm"
  name     = each.value.name
  location = each.value.location
  tags     = var.tags
}
module "vnet" {
  for_each = var.vnets
  source   = "Azure/avm-res-network-virtualnetwork/azurerm"

  name       = each.value.vnet_name
  location   = each.value.vnet_location
  parent_id  = module.resource_group[each.value.resource_group_key].resource_id
  address_space = each.value.address_space

  # 👇 each VNet ke liye 3 subnets banenge
  subnets = {
    for s in each.value.subnets :
    s.name => {
      name             = s.name
      address_prefixes = s.address_prefixes
    }
  }

  tags = var.tags
}