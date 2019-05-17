resource "azurerm_resource_group" "default" {
  name     = "myTestRG"
  location = "West US"
}
module "manage_mssql" {
  source = "./modules/managed_sql"
  managedInstanceName = ""
  administratorLogin = ""
  administratorLoginPassword = ""
  azurerm_resource_group_name = "${azurerm_resource_group.default.name}"
  location = "${azurerm_resource_group.default.location}"
  licenseType = "BasePrice"
  skuName = "GP_Gen5"
}