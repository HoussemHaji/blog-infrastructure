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
  name = var.cluster_name
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }


}


resource "azurerm_mysql_server" "db_server" {
  name = "my-db-server"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    name = "B_Basic_1"
    tier = "Basic"
    capacity = 1
  }

  administrator_login = "myadmin"
  administrator_login_password = "your_password"  # Store securely!
}

resource "azurerm_mysql_database" "db" {
  name = "mydatabase"
  server_id = azurerm_mysql_server.db_server.id
}