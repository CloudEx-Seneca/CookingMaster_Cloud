variable "resource_group_name" {
  default = "CloudEx-Seneca-RG"
}

variable "location" {
  default = "East US"
}

variable "port" {
  type        = number
  description = "Port to open on the container and the public IP address."
  default     = 80
}

variable "cpu_cores" {
  type        = number
  description = "The number of CPU cores to allocate to the container."
  default     = 1
}

variable "memory_in_gb" {
  type        = number
  description = "The amount of memory to allocate to the container in gigabytes."
  default     = 2
}

variable "restart_policy" {
  type        = string
  description = "The behavior of Azure runtime if container has stopped."
  default     = "Always"
  validation {
    condition     = contains(["Always", "Never", "OnFailure"], var.restart_policy)
    error_message = "The restart_policy must be one of the following: Always, Never, OnFailure."
  }
}

variable "db_image" {
  default     = "henry071190/backend_db"
  description = "Docker image for backend db"
}

variable "recipe_db_image" {
  default     = "henry071190/recipe-db"
  description = "Docker image for recipe db"
}

variable "DOCKER_REGISTRY_USERNAME" {
  description = "The Docker registry username"
  type        = string
}

variable "DOCKER_REGISTRY_PASSWORD" {
  description = "The Docker registry password"
  type        = string
}

variable "MYSQL_ROOT_PASSWORD" {
  type        = string
  description = "The password for the MySQL root user"
  sensitive   = true
}

