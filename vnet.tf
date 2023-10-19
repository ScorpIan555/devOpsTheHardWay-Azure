# @TODO 
# implement security ideas from cloud adoption framework:  https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/secure/security-top-10#7-technology-integrate-native-firewall-and-network-security

#  I think this is unnecessary here b/c this is pulling in resources that would have been created as a person went step-by-step thru the DevOps the Hard Way thing.
#  There's a couple places in the code that are dependent on calling this as it's formatted here, so fix that later.

# actually, this comment above was wrong, it's a reference expression that creates and implicit dependency and is necessary
data "azurerm_resource_group" "resource_group" {
  name = "${var.name}-rg"
  

  depends_on = [
    azurerm_container_registry.acr
  ]
}


# # new, see about adding some security
# resource "azurerm_network_security_group" "example" {
#   name                = "example-security-group"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name

#   security_rule {
#     name                       = "allow_ssh"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "22"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#   security_rule {
#     name                       = "allow_http_https"
#     priority                   = 200
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = ["80", "443"]
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
# }

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

# ffrom gpt4, so check this
# resource "azurerm_subnet_network_security_group_association" "example" {
#   subnet_id                 = azurerm_subnet.example.id
#   network_security_group_id = azurerm_network_security_group.example.id
# }
