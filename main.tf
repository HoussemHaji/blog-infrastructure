# configure Azure Provider
provider "azurerm"{
    features {}
    subscription_id = ""
}

# Add resource group
resource "azurerm_resource_group" "rg" {
  name = "my-aks-cluster-rg"
  location = "East US"
}


# Add vnet and subnet
resource "azurerm_virtual_network" "vnet" {
  name = "my-aks-vnet"
  location = azurerm_resource_group.rg.location
  address_space = ["10.0.0.0/16"]

  subnet {
    name = "my-aks-subnet"
    address_prefix = "10.0.1.0/24"
  }
}