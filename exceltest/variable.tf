# variables.tf
variable "resource_groups" {
  type = map(object({
    location = string
    tags     = map(string)
  }))
}

variable "virtual_networks" {
  type = map(object({
    address_space = list(string)
    location      = string
    resource_group_name = string

  }))
}

variable "subnets" {
  type = map(object({
    address_prefixes = list(string)
    vnet_name        = string
    resource_group_name = string
    
  }))
}

# variable "storage_accounts" {
#   type = map(object({
#     location            = string
#     account_tier        = string
#     account_replication_type = string
#   }))
# }