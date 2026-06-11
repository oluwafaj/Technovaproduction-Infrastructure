resource "azurerm_virtual_machine" "TechNova_VM" {
  name                  = "TechNova-VM"
  location              = var.location
  resource_group_name   = var.resource_group
  network_interface_ids = [azurerm_network_interface.TechNova_NIC.id]
  vm_size               = "Standard_DS1_v2"



  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "TechNova_OS_Disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    os_type           = "Windows"
  }

  os_profile {
    computer_name  = "TechNovaVM"
    admin_username = var.admin_username
    admin_password = data.azurerm_key_vault_secret.admin-password.value
  }

  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = true
  }
  
}

resource "azurerm_availability_set" "TechNova_AVSet" {
  name                = "TechNova-AVSet"
  location            = var.location
  resource_group_name = var.resource_group
}

resource "azurerm_network_interface" "TechNova_NIC" {
  name                = "TechNova-NIC"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "TechNova-IPConfig"
    subnet_id                     = azurerm_subnet.Web.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_service_plan" "TechNova_AppPlan" {
  name                = "TechNova-AppPlan"
  location            = var.location
  resource_group_name = var.resource_group
  os_type = "Linux"
  sku_name = "S1"

}

resource "azurerm_linux_web_app" "TechNova_AppService" {
  name                = "TechNova-AppService"
  location            = var.location
  resource_group_name = var.resource_group
  service_plan_id = azurerm_service_plan.TechNova_AppPlan.id
site_config {
  
}
}

