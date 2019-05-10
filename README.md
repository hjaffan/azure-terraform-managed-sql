# Purpose
This module provides the capablity of creating a managed sql instance in Microsoft Azure

This is achived using the azure deployment via azure templates.

# Variable Defaults

| **Variable Name** | **Type** | **Default** |
|------|---------|----------|
|resourceGroupName|String|none|
|resourceGroupLocation|String|none|
|databaseName|String|none|
|sqlAdministratorLoginPassword|String|none|
|sqlAdministratorLogin|String|terraform-user|
|transparentDataEncryption|String|Disabled|
|databaseEdition|String|Basic|
|databaseCollation|String|SQL_Latin1_General_CP1_CI_AS|
|databaseServiceObjectiveName|String|Basic|

# Usage

## main.tf
```tf
module "manage_mssql" {
  source = "./modules/managed_sql"
  databaseName = "my_defaultDb"
  resourceGroupName = "acctestRG-101"
  sqlAdministratorLogin = "sys_adminuser"
  sqlAdministratorLoginPassword = "SuperSece@ret123"
  resourceGroupLocation = "West US"
}
```
## provider.tf
```tf
provider "azurerm" {
    subscription_id = "xxxx-xxxx-xxxx-xxxx"
    client_id       = "xxxx-xxxx-xxxx-xxxx"
    client_secret   = "xxxx-xxxx-xxxx-xxxx"
    tenant_id       = "xxxx-xxxx-xxxx-xxxx"
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=1.24.0"
}
```
```bash
terraform init # Run this to import the module
```