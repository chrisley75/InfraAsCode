resource "azurerm_managed_disk" "elkcleyDataDisk01" {
  name                 = "elkcleyDataDisk01"
  location              = "francecentral"
  resource_group_name   = azurerm_resource_group.cley-rg.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 100
  tags = {
        environment = "chrisley"
        owner       = "chrisley"
        label       = "disk"
        project     = "ELK"
        Number      = "01"
    }
}

resource "azurerm_virtual_machine_data_disk_attachment" "elkcleyDataDisk01_att" {
  managed_disk_id    = azurerm_managed_disk.elkcleyDataDisk01.id
  virtual_machine_id = azurerm_virtual_machine.elkcleyvm01.id
  lun                = "1"
  caching            = "ReadWrite"
}
