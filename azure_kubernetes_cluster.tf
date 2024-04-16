provider "azurerm" {
    features {} = {
        resource_group {
            supports_nested_resources = true
        }
    }
}

resource "azurerm_resource_group" "rg" {
    name     = "resource_group_name"
    location = "region"
}

resource "azurerm_kubernetes_cluster" "aks" {
    name                = "aks_cluster_name"
    location             = azurerm_resource_group.rg.location
    resource_group_name  = azurerm_resource_group.rg.name
    dns_prefix          = "aks_dns_prefix"
    kubernetes_version = "latest"

    node_resource_group {
        name = azurerm_resource_group.rg.name
    }

    # Configure node pool (VM size, etc.)
    node_pool {
        name      = "default"
        node_count = 2
        vm_size   = "Standard_B1s"
    }
}

