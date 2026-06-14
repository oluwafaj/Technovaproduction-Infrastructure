variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnets" {
  type = map(object({
    address_prefixes = list(string)
  }))
}

variable "nsg_name" {
  type = string
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resources"
}