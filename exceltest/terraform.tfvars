resource_groups = {
  "rg-test-dev": {
    "location": "eastus",
    "tags": {
      "environment": "dev"
    }
  },
  "rg-test-prod": {
    "location": "westus",
    "tags": {
      "environment": "prod"
    }
  }
}

virtual_networks = {
  "vnet-dev": {
    "resource_group_name": "rg-test-dev",
    "location": "eastus",
    "address_space": [
      "10.0.0.0/16"
    ]
  },
  "vnet-prod": {
    "resource_group_name": "rg-test-prod",
    "location": "westus",
    "address_space": [
      "10.1.0.0/16"
    ]
  }
}

subnets = {
  "subnet-dev": {
    "resource_group_name": "rg-test-dev",
    "vnet_name": "vnet-dev",
    "address_prefixes": [
      "10.0.1.0/24"
    ]
  },
  "subnet-prod": {
    "resource_group_name": "rg-test-prod",
    "vnet_name": "vnet-prod",
    "address_prefixes": [
      "10.1.1.0/24"
    ]
  }
}

