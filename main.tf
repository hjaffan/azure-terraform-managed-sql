resource "azurerm_resource_group" "default" {
  name     = "${var.resourceGroupName}"
  location = "${var.resourceGroupLocation}"
}
module "manage_mssql" {
  source = "./modules/managed_sql"
  managedInstanceName = ""
  administratorLogin = ""
  administratorLoginPassword = ""
  azurerm_resource_group_name = "${azurerm_resource_group.default.name}"
}