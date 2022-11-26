data "azurerm_resource_group" "resource_group" {
  name = "${var.name}-rg"
  
  depends_on = [
    azurerm_container_registry.acr
  ]
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = "${var.name}-vnet"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  address_space       = [var.network_address_space]

  depends_on = [
    azurerm_resource_group.acr_resource_group
  ]
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = var.aks_subnet_address_name
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [var.aks_subnet_address_prefix]

  depends_on = [
    azurerm_resource_group.acr_resource_group
  ]
}

resource "azurerm_subnet" "app_gwsubnet" {
  name                 = var.subnet_address_name
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [var.subnet_address_prefix]

  depends_on = [
    azurerm_resource_group.acr_resource_group
  ]
}

