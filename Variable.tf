variable "resource_group" {
    description = "The name of the resource group in which to create the virtual network."
    type        = string
}

variable "location" {
    description = "The Azure region where the virtual network will be created."
    type        = string
}

variable "address_space" {
    description = "The address space for the virtual network, in CIDR notation."
    type        = list(string)
}

variable "admin_username" {
    description = "The admin username for the virtual machine."
    type        = string
  
}


