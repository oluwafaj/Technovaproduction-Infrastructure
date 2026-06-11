resource "azurerm_virtual_network" "TechNova_VNet" {
  name                = "TechNova-VNet"
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group
}

resource "azurerm_subnet" "Web" {
  name                 = "Web"
  virtual_network_name = azurerm_virtual_network.TechNova_VNet.name
  resource_group_name  = var.resource_group
  address_prefixes     = ["10.0.1.0/24"]            
}

resource "azurerm_subnet" "App" {
  name                 = "App"
  virtual_network_name = azurerm_virtual_network.TechNova_VNet.name
  resource_group_name  = var.resource_group
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "DB" {
  name                 = "DB"
  virtual_network_name = azurerm_virtual_network.TechNova_VNet.name
  resource_group_name  = var.resource_group
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_network_security_group" "TechNova_NSG" {
  name                = "TechNova-NSG"
  location            = var.location
  resource_group_name = var.resource_group
}

resource "azurerm_subnet_network_security_group_association" "Web_NSG_Association" {
  subnet_id                 = azurerm_subnet.Web.id
  network_security_group_id = azurerm_network_security_group.TechNova_NSG.id
}

resource "azurerm_subnet_network_security_group_association" "App_NSG_Association" {
  subnet_id                 = azurerm_subnet.App.id
  network_security_group_id = azurerm_network_security_group.TechNova_NSG.id
}

resource "azurerm_subnet_network_security_group_association" "DB_NSG_Association" {
  subnet_id                 = azurerm_subnet.DB.id
  network_security_group_id = azurerm_network_security_group.TechNova_NSG.id
}   

