output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "kubeconfig_content" {
  value = base64decode(azurerm_kubernetes_cluster.aks.kube_config)
}

