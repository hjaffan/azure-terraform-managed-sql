output "sqlServerFqdn" {
  value = "${lookup(azurerm_template_deployment.test.outputs, "sqlServerFqdn")}"
}

output "databaseName" {
  value = "${lookup(azurerm_template_deployment.test.outputs, "databaseName")}"
}