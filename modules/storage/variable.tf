variable "resource_group_name" {
    type = string
    description = "The name of the resource group"
}

variable "location" {
    type = string
    description = "The Azure region where the resources will be created"
}

variable "storage_account_name" {   
    type = string
    description = "The name of the Azure Storage Account"
  
}

variable "storage_account_tier" {
    type        = string
    description = "The tier of the Azure Storage Account"
    default     = "Standard"
}  

variable "storage_account_replication_type" {
    type        = string
    description = "The replication type of the Azure Storage Account"
    default     = "GRS"
}

variable "tags" {
    type = map(string)
    description = "A map of tags to assign to the resources"
}

variable "file_share_name" {
  type    = string
  default = "appshare"
}

variable "file_share_quota" {
  type    = number
  default = 5
}