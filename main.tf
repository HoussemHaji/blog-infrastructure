# Configure Azure Provider
provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location = var.location
}

# AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name



  node_pool_name = var.cluster_name

  linux_node_pool {
    name      = var.node_pool_name
    vm_size   = var.node_vm_size
    node_count = var.node_count
  }

  
}
