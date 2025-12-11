terraform {
  required_version = ">= 1.9.0, < 2.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.48.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-devops"
    storage_account_name = "githubactonstg"
    container_name       = "githubcontainer"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }

  subscription_id = "de1c1815-4f90-412b-9551-d55f0de9407d"
}
