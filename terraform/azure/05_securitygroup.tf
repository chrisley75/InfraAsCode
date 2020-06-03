# Create Network Security Group and rule
resource "azurerm_network_security_group" "elk-cley-nsg" {
    name                = "elk-cley-nsg"
    location            = "francecentral"
    resource_group_name = azurerm_resource_group.cley-rg.name
    
    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "kibana-gui"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5601"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }   

        security_rule {
        name                       = "elasticsearch-http"
        priority                   = 1003
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "9200"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }  

        security_rule {
        name                       = "logstash"
        priority                   = 1004
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5044"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }  

    tags = {
        environment = "chrisley"
        owner       = "chrisley"
        label       = "Network Security Group"
        project     = "ELK"
        Version     = "1.0"
    }
}

# Create network interface
resource "azurerm_network_interface" "elk-cley-nic" {
    name                      = "elk-cley-nic"
    location                  = "francecentral"
    resource_group_name       = azurerm_resource_group.cley-rg.name

    ip_configuration {
        name                          = "elk-cley-nic-NicConfiguration"
        subnet_id                     = azurerm_subnet.cley-subnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.elk-cley-ip.id
    }

    tags = {
        environment = "chrisley"
        owner       = "chrisley"
        label       = "Public IP"
        project     = "ELK"
        Number      = "01"
    }
}

# Associate Network Security group with Subnet
resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.cley-subnet.id
  network_security_group_id = azurerm_network_security_group.elk-cley-nsg.id
}
