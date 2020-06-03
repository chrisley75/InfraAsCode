# Create subnet
resource "azurerm_subnet" "cley-subnet" {
    name                 = "cley-subnet"
    resource_group_name  = azurerm_resource_group.cley-rg.name
    virtual_network_name = azurerm_virtual_network.cley-vnet.name
    address_prefix       = "10.0.0.0/25"
}
