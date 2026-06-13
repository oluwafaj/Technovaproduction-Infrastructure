terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "RG-Production"
    storage_account_name = "technovaprodremotestate"
    container_name       = "technovaprodblob"
    key                  = "prod/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
