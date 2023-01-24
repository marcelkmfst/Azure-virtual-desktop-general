# Resource group name is output when execution plan is applied.
resource "azurerm_resource_group" "sh" {
  name     = var.rg_name
  location = var.resource_group_location
}

# Create AVD workspace
resource "azurerm_virtual_desktop_workspace" "workspace" {
  name                = var.workspace
  resource_group_name = azurerm_resource_group.sh.name
  location            = azurerm_resource_group.sh.location
  friendly_name       = "${var.prefix} Workspace"
  description         = "${var.prefix} Workspace"
}

# Create AVD host pool
resource "azurerm_virtual_desktop_host_pool" "hostpool" {
  resource_group_name   = azurerm_resource_group.sh.name
  location              = azurerm_resource_group.sh.location
  name                  = var.hostpool
  friendly_name         = var.hostpool
  validate_environment  = false
  custom_rdp_properties = "audiocapturemode:i:1;audiomode:i:0;"
  start_vm_on_connect   =  true 
  description           = "${var.prefix} Terraform HostPool"
  type                  = "Personal"
  personal_desktop_assignment_type = Automatic 
  # not needed - personal maximum_sessions_allowed = 16
  # not needed personal load_balancer_type       = "DepthFirst" #[BreadthFirst DepthFirst]
   scheduled_agent_updates {
    enabled = true
    schedule {
      day_of_week = "Saturday"
      hour_of_day = 2
    }
   }
}

resource "azurerm_virtual_desktop_host_pool_registration_info" "registrationinfo" {
  hostpool_id     = azurerm_virtual_desktop_host_pool.hostpool.id
  expiration_date = var.rfc3339
}

# Create AVD DAG
resource "azurerm_virtual_desktop_application_group" "dag" {
  resource_group_name = azurerm_resource_group.sh.name
  host_pool_id        = azurerm_virtual_desktop_host_pool.hostpool.id
  location            = azurerm_resource_group.sh.location
  type                = "Desktop"
  name                = "${var.prefix}-dag"
  friendly_name       = var.desktop-app-group
  description         = "AVD application group"
  depends_on          = [azurerm_virtual_desktop_host_pool.hostpool, azurerm_virtual_desktop_workspace.workspace]
}

# Associate Workspace and DAG
resource "azurerm_virtual_desktop_workspace_application_group_association" "ws-dag" {
  application_group_id = azurerm_virtual_desktop_application_group.dag.id
  workspace_id         = azurerm_virtual_desktop_workspace.workspace.id
}