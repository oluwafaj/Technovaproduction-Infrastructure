terraform {
  backend "azurerm" {
    resource_group_name  = "RG-Production"
    storage_account_name = "technovaprodremotestate"
    container_name       = "technovaprodblob"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {
  }
}
