# Create public IPs
resource "azurerm_public_ip" "elk-cley-ip" {
    name                         = "elk-cley-ip"
    location                     = "francecentral"
    resource_group_name          = azurerm_resource_group.cley-rg.name
    allocation_method            = "Dynamic"

    tags = {
        environment = "chrisley"
        owner       = "chrisley"
        label       = "Public IP"
        project     = "ELK"
    }
}
