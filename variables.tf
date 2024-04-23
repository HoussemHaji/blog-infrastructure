variable "resource_group_name" {
  type = string
  description = "Name of the resource group"
}

variable "location" {
  type = string
  description = "Location of the AKS cluster"
}

variable "cluster_name" {
  type = string
  description = "Name of the AKS cluster"
}

variable "node_vm_size" {
  type = string
  description = "Size of the virtual machines in the node pool"
}

variable "node_count" {
  type = number
  description = "Number of virtual machines in the node pool"
}
