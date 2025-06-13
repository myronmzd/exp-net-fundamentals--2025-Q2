# This Terraform script automates the creation of a Windows VM in Azure with two network interfaces.
provider "azurerm" {
  features {}
  subscription_id = "f8fb825d-8543-48a1-9c64-4eec18688199"
}

resource "azurerm_resource_group" "rg" {
  name     = "winvm-net-rg"
  location = "West India"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "winvm-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  address_prefixes     = ["10.0.1.0/24"]
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  address_prefixes     = ["10.0.2.0/24"]
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}

resource "azurerm_public_ip" "winvm_public_ip" {
  name                = "winvm-public-ip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "nic1" {
  name                = "nic1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.winvm_public_ip.id
  }
}

resource "azurerm_network_interface" "nic2" {
  name                = "nic2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet2.id
    private_ip_address_allocation = "Dynamic"
  }
}
data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}

resource "azurerm_network_security_group" "rdp_nsg" {
  name                = "rdp-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "Allow-RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*" # "${chomp(data.http.myip.response_body)}/32"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "subnet1_nsg" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.rdp_nsg.id
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                = "winvm"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  size                = "Standard_B2ms"  # CHEAPEST Windows-compatible

  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.nic1.id,
    azurerm_network_interface.nic2.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"  # Cheaper disk
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }

  computer_name  = "winvm"
}
