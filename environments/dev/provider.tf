terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "RG-Development"
    storage_account_name = "technovadevremotestate"
    container_name       = "technovadevblob"
    key                  = "dev/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
