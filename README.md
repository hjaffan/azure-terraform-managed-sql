# Purpose
This module provides the capablity of creating a managed sql instance in Microsoft Azure

This is achived using the azure deployment via azure templates.

# Variable Defaults

| **Variable Name** | **Type** | **Default** | **Description** |
|------|---------|----------|--------|
|azurerm_resource_group_name|string| | 
|databaseResourceName|string|None| 
|managedInstanceName|string|None|Enter managed instance name.|
|administratorLogin|string|None|Enter user name.|
|administratorLoginPassword|string|None|Enter password.|
|location|string|None|Enter location. If you leave this field blank resource group location would be used.|
|virtualNetworkName|string|SQLMI-VNET|Enter virtual network name. If you leave this field blank name will be created by the template.|
|addressPrefix|string|10.0.0.0/16|Enter virtual network address prefix.|
|subnetName|string|ManagedInstance|Enter subnet name.|
|subnetPrefix|string|10.0.0.0/24|Enter subnet address prefix.|
|skuName|string|GP_Gen4|Enter sku name.|
|vCores|int|8|Enter number of vCores.|
|storageSizeInGB|ing|32|Enter storage size.|
|licenseType|string|LicenseIncluded|Enter license type.|

# Usage

## main.tf
```tf
resource "azurerm_resource_group" "default" {
  name     = "acctestRG-101"
  location = "West US"
}

module "manage_mssql" {
  source = "./modules/managed_sql"
  managedInstanceName = "mydefaultinstancename"
  administratorLogin = "sys_adminuser"
  administratorLoginPassword = "SuperSecret@123"
  azurerm_resource_group_name = "${azurerm_resource_group.default.name}"
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

## Known Issue

During the public preview deployment might take up to 6h. This is because virtual cluster that hosts the instances needs some time to deploy. Each subsequent instance creation in the same virtual cluster takes just about a few minutes.

After the last Managed Instance is deprovisioned, cluster stays a live for up to 24h. This is to avoid waiting for a new cluster to be provisioned in case that customer just wants to recreate the instance. During that period of time Resource Group and virtual network could not be deleted. This is a known issue and Managed Instance team is working on resolving it.