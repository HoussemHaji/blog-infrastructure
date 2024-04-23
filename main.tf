# configure Azure Provider
provider "azurerm"{
    features {}
    subscription_id = ""
}

# Add resource group
resource "azurerm_resource_group" "rg" {
  name = "my-aks-cluster-rg"
  location = "West Europe"
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

# Add aks cluster
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name = "my-aks-cluster"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }


}