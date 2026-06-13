output "keyvault_id" {
  description = "The keyvault id"
  value = azurerm_key_vault.technova-kv
}

output "keyvault_uri" {
  description = "The keyvault uri"
  value = azurerm_key_vault.technova-kv.vault_uri
}

output "admin_password" {
  description = "The admin password for the VM stored in Key Vault"
  value = azurerm_key_vault_secret.vm-admin-password.value
  sensitive = true
  
}