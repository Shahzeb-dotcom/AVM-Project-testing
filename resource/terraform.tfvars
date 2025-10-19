# rg_name  = "avm-demo-rg"
# location = "eastus"
# tags = {
#   environment = "dev"
#   owner       = "shahzeb"
# }

rg_name  = {
  rg1 = {
    name     = "avm-demo-rg1"
    location = "eastus"
   
  }
  rg2 = {
    name     = "avm-demo-rg2"
    location = "eastus2"
  }
}

vnets = {
  vnet1 = {
    vnet_name           = "vnet-eastus"
    vnet_location            = "eastus"
    resource_group_key  = "rg1"
    address_space       = ["10.0.0.0/16"]
    subnets = [
      { name = "subnet-app",  address_prefixes = ["10.0.1.0/24"] },
      { name = "subnet-db",   address_prefixes = ["10.0.2.0/24"] },
      { name = "subnet-mgmt", address_prefixes = ["10.0.3.0/24"] }
    ]
  }
    vnet2 = {
        vnet_name           = "vnet-eastus2"
        vnet_location            = "eastus2"
        resource_group_key  = "rg2"
        address_space       = ["10.0.0.0/16"]
        subnets = [
          { name = "subnet-app",  address_prefixes = ["10.0.1.0/24"] },
          { name = "subnet-db",   address_prefixes = ["10.0.2.0/24"] },
          { name = "subnet-mgmt", address_prefixes = ["10.0.3.0/24"] }
        ]
      }
}


