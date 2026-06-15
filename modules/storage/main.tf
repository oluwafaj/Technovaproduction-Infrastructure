resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  tags                     = var.tags
}

resource "azurerm_storage_share" "share" {
  name                 = var.file_share_name
  storage_account_name = azurerm_storage_account.storage.name
  quota                = var.file_share_quota
  enabled_protocol     = "SMB"
}