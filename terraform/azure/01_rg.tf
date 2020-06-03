# creation de mon group
resource "azurerm_resource_group" "cley-rg" {
    name     = "cley-rg"
    location = "francecentral"

    tags = {
        environment = "chrisley"
        owner       = "chrisley"
        label       = "Resource Group"
    }
}