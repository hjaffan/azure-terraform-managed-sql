# Logical App Module

# Variable Defaults

| **Variable Name** | **Type** | **Default** | **Description** |
|------|---------|----------|--------|
|logicAppName|string| None|Name of the logical application|
|testUri|string|None|Test URIL required for the logical application |
|location|string| None|Azure location|
|logicAppResourceName|string|None|Name of the resource|
|azurermResourceGroupName|string| None| Resource Group needed to provision resource|

# Usage

## main.tf
```tf
resource "azurerm_resource_group" "default" {
  name     = "acctestRG-101"
  location = "West US"
}

module "logical_app" {
  source = "./modules/logical_app"
  location = "westus"
  logicAppName = "testapplication"
  logicAppResourceName = "testapp"
  azurermResourceGroupName = "${azurerm_resource_group.default.name}"
  testUri = "https://test" 
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
  version = "=1.28.0"
}
```

```bash
terraform init # Run this to import the module
```