# main.tf

# Resource Groups
resource "azurerm_resource_group" "rg" {
  for_each = var.resource_groups
  
  name     = each.key
  location = each.value.location
  tags     = each.value.tags
}

# Virtual Networks
resource "azurerm_virtual_network" "vnet" {
  for_each = var.virtual_networks
  depends_on = [azurerm_resource_group.rg]

  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
}

# Subnets
resource "azurerm_subnet" "subnet" {
  for_each = var.subnets
  depends_on = [azurerm_virtual_network.vnet]

  name                 = each.key
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes
}

# Storage Accounts
# resource "azurerm_storage_account" "storage" {
#   for_each = var.storage_accounts

#   name                     = each.key
#   resource_group_name      = each.value.resource_group_name
#   location                 = each.value.location
#   account_tier             = each.value.account_tier
#   account_replication_type = each.value.account_replication_type

#   depends_on = [azurerm_resource_group.rg]
# }