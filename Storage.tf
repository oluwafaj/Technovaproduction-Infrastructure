resource "azurerm_storage_account" "Technova" {
  name                     = "technovastorageacct"
  resource_group_name      = var.resource_group
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_container" "TechNova_Container" {
  name                  = "technovacontainer"
  storage_account_id    = azurerm_storage_account.Technova.id
  container_access_type = "private"

}

resource "azurerm_storage_share" "TechNova_FileShare" {
  name               = "technovafileshare"
  storage_account_id = azurerm_storage_account.Technova.id
  quota              = 5120

}

