variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The Azure region where the resources will be created"
}

variable "keyvault_name" {
  type        = string
  description = "The name of the Azure Key Vault"
}

variable "tenant_id" {
  type        = string
  description = "The tenant ID for Azure authentication"
}

variable "object_id" {
  type        = string
  description = "The object ID for Azure authentication"
}

variable "sku_name" {
  type        = string
  description = "The SKU name for the Azure Key Vault"
  default     = "standard"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resources"
}