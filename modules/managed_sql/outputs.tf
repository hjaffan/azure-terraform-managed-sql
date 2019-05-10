output "sqlServerFqdn" {
  value = "${lookup(azurerm_template_deployment.default.outputs, "sqlServerFqdn")}"
}

output "databaseName" {
  value = "${lookup(azurerm_template_deployment.default.outputs, "databaseName")}"
}