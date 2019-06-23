resource "azurerm_resource_group" "default" {
  name     = "myTestRG"
  location = "West US"
}

module "manage_mssql" {
  source = "./modules/managed_sql"
  managedInstanceName = ""
  administratorLogin = ""
  administratorLoginPassword = ""
  azurermResourceGroupName = ""
  location = "westus"
  networkName = ""
  subnetName = ""
  licenseType = "BasePrice"
  skuName = "GP_Gen5"
}