data "azurerm_key_vault" "TechNova_KV" {
  name                = "technovaprod-kv"
  resource_group_name = var.resource_group
  
}

data "azurerm_key_vault_secret" "admin-password" {
  name         = "admin-password"
  key_vault_id = data.azurerm_key_vault.TechNova_KV.id
  
}