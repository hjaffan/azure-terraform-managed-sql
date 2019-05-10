module "manage_mssql" {
  source = "./modules/managed_sql"
  databaseName = "my_defaultDb"
  resourceGroupName = "acctestRG-101"
  sqlAdministratorLoginPassword = "SuperSece@ret123"
  resourceGroupLocation = "US WEST"
}
