# Create Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "insights" {
  location            = azurerm_resource_group.aks_rg.location
  name                = "logs-${random_pet.aksrandom.id}"
  resource_group_name = azurerm_resource_group.aks_rg.name
  sku                 = "PerGB20218"
  retention_in_days   = 30
}