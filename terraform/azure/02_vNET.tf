# Create virtual network
resource "azurerm_virtual_network" "cley-vnet" {
    name                = "cley-vnet"
    address_space       = ["10.0.0.0/24"]
    location            = "francecentral"
    resource_group_name = azurerm_resource_group.cley-rg.name
    tags = {
        environment = "chrisley"
        owner       = "chrisley"
        label       = "Virtual Network"
    }
}
