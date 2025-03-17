variable "location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "rg_name" {
  type        = string
  default     = "CloudEx-Seneca-K8s-RG"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "k8s_name" {
  type        = string
  default     = "CookingMaster-K8S-Cluster"
  description = "K8s cluster name"
}

variable "dns_prefix" {
  type        = string
  default     = "cookingmaster"
  description = "Prefix of container."
}


variable "node_count" {
  type        = number
  description = "The initial quantity of nodes for the node pool."
  default     = 2
}

variable "msi_id" {
  type        = string
  description = "The Managed Service Identity ID. Set this value if you're running this example using Managed Identity as the authentication method."
  default     = null
}

variable "username" {
  type        = string
  description = "The admin username for the new cluster."
  default     = "azureadmin"
}

variable "publicKey" {
  type        = string
  description = "public key value."
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCdpe//tDmFN+rR2Uj+7lt+KDPZKp7r0rw4gkwJ0G2gXy07UXKbRfVhhnG658QUM6q/98B4jrZaK6pLUvC7vZY5NuBl555ygo2ZIJaqbJsdwyq36YSmNqofNloG1e9JHaX+aA9W99mpmpF7Rll+wIx0UoO4CMNHZHhqg0MCrypn0sV5ss9fwAbSmNqmywdESyFM3mBSf9z6VzH2VCHsMcDrPBrwYcv9PNDcWHUGO6NBxjbmnwEQPyEwy7PakA2Kit6iegYmpZGeJybAtydGy7RFhaPbU/gmI1F2GsDEwgB+vYDMl0Jmx+SMtWMfccWajy4XtHrhXvwnE92jP14Hr1keCZtJrIsRPuZiflvzeo4+qdNgy9NxPFGE/7HyHTa4gUPYmjvdBOe+6SHqObo6GkDsfjE0dRyCWBaYbxDapnQZNfxeZGIxyr3CgkoAyLdMVoqzzoSRJiGw00VQ7mRbZ57wn8FVD7nTENZK3NiAsAxBY1gDUG2PHhN5vwlXaGwU8H0= trung@Henry"
}