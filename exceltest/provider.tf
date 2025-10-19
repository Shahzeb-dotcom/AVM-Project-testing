terraform {
    required_version = ">= 1.9.0, < 2.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.48.0"
    }
  }
}

provider "azurerm" {
    features {
        resource_group {
            prevent_deletion_if_contains_resources = false
        }
    }
    subscription_id = "4a56d5b3-94c0-47a0-ab55-850ee42f58bd"
  # Configuration options
}