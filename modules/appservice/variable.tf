variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "app_service_plan_name" {
  type = string
}

variable "app_service_name" {
  type    = string
  default = ""
}

variable "sku_name" {
  type    = string
  default = "S1"
}

variable "php_version" {
  type    = string
  default = "8.2"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resources"
  default     = {}
}
