output "storage_account_id" {
  value = azurerm_storage_account.storage.id
}

output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.storage.primary_blob_endpoint
}

output "file_share_url" {
  value = azurerm_storage_share.share.url
}