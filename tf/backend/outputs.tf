output "backend_url" {
  value = azurerm_container_app.backend.ingress[0].fqdn
}

output "recipe_url" {
  value = azurerm_container_app.recipe.ingress[0].fqdn
}

