# Resource Group for monitoring resources
resource "azurerm_resource_group" "monitoring" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "law" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = azurerm_resource_group.monitoring.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = var.tags
}

# Action Group - sends email notifications
resource "azurerm_monitor_action_group" "main" {
  name                = var.action_group_name
  resource_group_name = azurerm_resource_group.monitoring.name
  short_name          = "monitoralrt"
  tags                = var.tags

  email_receiver {
    name                    = "admin-email"
    email_address           = var.alert_email_address
    use_common_alert_schema = true
  }
}

# CPU Alert Rule (VM)
resource "azurerm_monitor_metric_alert" "cpu_alert" {
  name                = "${var.log_analytics_workspace_name}-cpu-alert"
  resource_group_name = azurerm_resource_group.monitoring.name
  scopes              = [var.vm_id]
  description         = "Alert when CPU usage exceeds threshold"
  severity            = 2
  frequency           = "PT5M"
  window_size         = "PT15M"
  tags                = var.tags

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = var.cpu_threshold
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}

# VM Availability Alert Rule
resource "azurerm_monitor_metric_alert" "availability_alert" {
  name                = "${var.log_analytics_workspace_name}-availability-alert"
  resource_group_name = azurerm_resource_group.monitoring.name
  scopes              = [var.vm_id]
  description         = "Alert when VM availability drops"
  severity            = 1
  frequency           = "PT5M"
  window_size         = "PT15M"
  tags                = var.tags

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "VmAvailabilityMetric"
    aggregation      = "Average"
    operator         = "LessThan"
    threshold        = 1
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}

# Storage Capacity Alert Rule
resource "azurerm_monitor_metric_alert" "storage_alert" {
  name                = "${var.log_analytics_workspace_name}-storage-alert"
  resource_group_name = azurerm_resource_group.monitoring.name
  scopes              = [var.storage_account_id]
  description         = "Alert when storage account capacity exceeds threshold"
  severity            = 2
  frequency           = "PT1H"
  window_size         = "PT6H"
  tags                = var.tags

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "UsedCapacity"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = var.storage_capacity_threshold_bytes
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}

# Connect VM to Log Analytics Workspace (Azure Monitor Agent extension)
resource "azurerm_virtual_machine_extension" "ama" {
  name                       = "AzureMonitorWindowsAgent"
  virtual_machine_id         = var.vm_id
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorWindowsAgent"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true
}

# Data Collection Rule - sends VM perf data to Log Analytics
resource "azurerm_monitor_data_collection_rule" "dcr" {
  name                = "${var.log_analytics_workspace_name}-dcr"
  resource_group_name = azurerm_resource_group.monitoring.name
  location            = var.location
  tags                = var.tags

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.law.id
      name                  = "destination-law"
    }
  }

  data_flow {
    streams      = ["Microsoft-Perf"]
    destinations = ["destination-law"]
  }

  data_sources {
    performance_counter {
      streams                       = ["Microsoft-Perf"]
      sampling_frequency_in_seconds = 60
      counter_specifiers = [
        "\\Processor(_Total)\\% Processor Time",
        "\\Memory\\Available MBytes",
        "\\LogicalDisk(_Total)\\% Free Space"
      ]
      name = "perfCounterDataSource"
    }
  }
}

# Associate the DCR with the VM
resource "azurerm_monitor_data_collection_rule_association" "dcra" {
  name                    = "${var.log_analytics_workspace_name}-dcra"
  target_resource_id      = var.vm_id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.dcr.id
}