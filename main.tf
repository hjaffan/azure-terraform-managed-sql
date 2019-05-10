module "manage_mssql" {
  source = "./modules/managed_sql"
  databaseName = "my_defaultDb"
  resourceGroupName = "acctestRG-101"
  sqlAdministratorLogin = "sys_adminuser"
  sqlAdministratorLoginPassword = "SuperSece@ret123"
  resourceGroupLocation = "West US"
}
