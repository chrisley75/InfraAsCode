# Create virtual machine
resource "azurerm_virtual_machine" "elkcleyvm01" {
    name                  = "elkcleyvm01"
    location              = "francecentral"
    resource_group_name   = azurerm_resource_group.cley-rg.name
    network_interface_ids = [azurerm_network_interface.elk-cley-nic.id]
    vm_size               = "Standard_D4s_v3"

    storage_os_disk {
        name              = "elkcleyOsDisk01"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "OpenLogic"
        offer     = "CentOS"
        sku       = "7.7"
        version   = "latest"
    }

    os_profile {
        computer_name  = "elkcleyvm01"
        admin_username = "chrisley"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/chrisley/.ssh/authorized_keys"
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDvKS/5y2MKKWzcDnpcGQL2SMe7D2N/+zBU8vIRVYV46jocU2MLLqQgNZGat+uASUC+HUPLyopgCdBCkXErLpF7Bk6RJPjFhLPxuc0+LKGQAd3d5FpCivlNEwJkExpw555xM/wvKRq/rNUT+RYXg8xDDnzhjzWUhUIPX5lD00pqHsDfOg2+i8UuCN2xW81b7LfTdtL/kc6J2iv5sxEijbdnUVsWHO6/jogv0w12bAB5GgHNdBFMlkoBkBvbirWfcVElG+oFr/ObnddhRvNTgD0ozAeQkU6g05BjQzgrBUpwb4jy5ar8eku17oZZFvq41693KRQEl7vakEJal4TokEyev62yCLfT4OuhOMp4axzv15DplnHOjGJlGvDeM5cOTz3gQgis8OJqCklCN6es1u/e7Oxd2NoqEic9HxUhn+NdvOz1iSqovDvZxyBdSKFthLa8TwMn0fDbVTkmtTqCPilt1msfx7RneChNAi85s60Dfy0W3wTIwnUQ181CUGBPLJC0gbp6rQKaknhEEEVoIsRWCztwFhD+rLOQAqU4wDmufA5MMEbj5qs04Ij2/pi8kVRjz9sAAlJWtYk9MApbFc4vuJn4AuNkjdomKHuXA0p8xkRGwc7S7MCtjl/EDYEiHmimPb8EWuv6Yve4yRp5MlAbnLf9czuEVQUsvtwMtjxkIw== ley@MacBook-Pro-de-LEY.home"
        }
    }

    tags = {
        environment = "chrisley"
        owner       = "chrisley"
        label       = "VM"
        project     = "ELK"
        Number      = "01"
    }
}
