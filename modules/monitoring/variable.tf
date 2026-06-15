variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "log_analytics_workspace_name" {
  type = string
}

variable "action_group_name" {
  type = string
}

variable "alert_email_address" {
  type = string
}

variable "vm_id" {
  type        = string
  description = "Resource ID of the VM to monitor"
}

variable "storage_account_id" {
  type        = string
  description = "Resource ID of the storage account to monitor"
}

variable "cpu_threshold" {
  type    = number
  default = 80
}

variable "storage_capacity_threshold_bytes" {
  type    = number
  default = 4294967296 # 4 GB, adjust to your share/account size
}

variable "tags" {
  type    = map(string)
  default = {}
}