variable "admin_username" {
  type    = string
  default = "adminuserprod"
}

variable "keyvault_name" {
  type    = string
  default = "technovadprod-kv"
}

variable "location" {
  type    = string
  default = "westeurope"
}

variable "resource_group_name" {
  type    = string
  default = "RG-Production"
}

variable "tenant_id" {
  type    = string
  default = "fcb74fb3-cf02-4a24-b3c9-fcaa1d691c2f"
}

variable "object_id" {
  type    = string
  default = "cff408fb-dd1d-4f43-aa6f-eea11e32c00c"
}

variable "sku_name" {
  type    = string
  default = "standard"
}

variable "storage_account_name" {
  type    = string
  default = "technovaprodst123"
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
  default = "technovaprod-app"
}

variable "app_service_plan" {
  type    = string
  default = "technovaprod-plan"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "file_share" {
  type    = string
  default = "prodshare"
}

variable "file_share_quota" {
  type    = number
  default = 5
}

