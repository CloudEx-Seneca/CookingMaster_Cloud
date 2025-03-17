resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = var.rg_name
}

resource "azurerm_kubernetes_cluster" "k8s" {
  location            = var.location
  name                = var.k8s_name
  resource_group_name = var.rg_name
  dns_prefix          = var.dns_prefix

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = "agentpool"
    vm_size    = "Standard_D2_v2"
    node_count = var.node_count
  }
  linux_profile {
    admin_username = var.username

    ssh_key {
      key_data = var.publicKey
    }
  }
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
}