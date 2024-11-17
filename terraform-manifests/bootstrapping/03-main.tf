resource "azurerm_resource_group" "aks_storage_rg" {
  name = var.resource_group_name
  location = var.location
}

# Create an Azure Storage Account
resource "azurerm_storage_account" "aks_storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.aks_storage_rg.name
  location                 = azurerm_resource_group.aks_storage_rg.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

resource "azurerm_storage_container" "container" {
  name                  = var.storage_container_name
  storage_account_id    = azurerm_storage_account.aks_storage_account.id
  container_access_type = var.storage_container_access_type
}