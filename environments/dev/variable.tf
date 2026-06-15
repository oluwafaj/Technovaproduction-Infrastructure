variable "keyvault_name" {
  type    = string
  default = "technovadev-kv"
}

variable "location" {
  type    = string
  default = "westeurope"
}

variable "resource_group_name" {
  type    = string
  default = "RG-Development"
}

variable "tenant_id" {
  type    = string
  default = "fcb74fb3-cf02-4a24-b3c9-fcaa1d691c2f"
}

variable "object_id" {
  type    = string
  default = "" # set to your actual object_id value
}

variable "sku_name" {
  type    = string
  default = "standard"
}

variable "storage_account_name" {
  type    = string
  default = "technovadevst123"
}

variable "storage_account_tier" {
  type    = string
  default = "Standard"
}

variable "storage_account_replication_type" {
  type    = string
  default = "GRS"
}

variable "app_service_name" {
  type    = string
  default = "technovadev-app"
}

variable "app_service_plan" {
  type    = string
  default = "technovadev-plan"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "file_share" {
  type    = string
  default = "devshare"
}

variable "file_share_quota" {
  type    = number
  default = 5
}

variable "admin_username" {
  type    = string
  default = "adminuserdev"
}
