resource "azurerm_template_deployment" "default" {
  name                = "${var.databaseResourceName}"
  resource_group_name = "${var.azurerm_resource_group_name}"

  template_body = <<DEPLOY
  {
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.1",
    "parameters": {
        "managedInstanceName": {
            "type": "string",
            "metadata": {
                "description": "Enter managed instance name."
            }
        },
        "administratorLogin": {
            "type": "string",
            "metadata": {
                "description": "Enter user name."
            }
        },
        "administratorLoginPassword": {
            "type": "securestring",
            "metadata": {
                "description": "Enter password."
            }
        },
        "location": {
            "type": "string",
            "defaultValue": "[resourceGroup().location]",
            "metadata": {
                "description": "Enter location. If you leave this field blank resource group location would be used."
            }
        },
        "subnetId": {
            "type": "string",
            "defaultValue": "",
            "metadata": {
                "description": "Enter subnetId."
            }
        },
        "skuName": {
            "type": "string",
            "allowedValues":[
                "GP_Gen4",
                "GP_Gen5",
                "BC_Gen4",
                "BC_Gen5"
            ],
            "defaultValue": "GP_Gen4",
            "metadata": {
                "description": "Enter sku name."
            }
        },
        "vCores": {
            "type": "string",
            "defaultValue": "8",
            "allowedValues":[
                "8",
                "16",
                "24",
                "32",
                "40",
                "64",
                "80"
            ],              
            "metadata": {
                "description": "Enter number of vCores."
            }
        },
        "storageSizeInGB": {
            "type": "string",         
            "defaultValue": "256",
            "metadata": {
                "description": "Enter storage size."
            }
        },
        "licenseType": {
            "type": "string",
            "defaultValue": "LicenseIncluded",
            "allowedValues":[
                "BasePrice",
                "LicenseIncluded"
            ],             
            "metadata": {
                "description": "Enter license type."
            }
        }
    },
    "variables": {
    },
    "resources": [    
        {
            "type": "Microsoft.Sql/managedInstances",
            "apiVersion": "2015-05-01-preview",
            "dependsOn":[
            ],
            "identity": {
                "type": "SystemAssigned"
            },
            "location": "[parameters('location')]",
            "name": "[parameters('managedInstanceName')]",
            "sku": {
                "name": "[parameters('skuName')]"
            },
            "properties": {
                "administratorLogin": "[parameters('administratorLogin')]",
                "administratorLoginPassword": "[parameters('administratorLoginPassword')]",
                "subnetId": "[parameters('subnetId')]",
                "storageSizeInGB": "[int(parameters('storageSizeInGB'))]",
                "vCores": "[int(parameters('vCores'))]",
                "licenseType": "[parameters('licenseType')]"
            }
        }
    ]
  }
  DEPLOY

  # these key-value pairs are passed into the ARM Template's `parameters` block
  parameters = {
    managedInstanceName = "${var.managedInstanceName}"
    administratorLogin = "${var.administratorLogin}"
    administratorLoginPassword = "${var.administratorLoginPassword}"
    location = "${var.location}"
    subnetId = "${var.subnetId}"
    skuName = "${var.skuName}"
    vCores = "${var.vCores}"
    storageSizeInGB = "${var.storageSizeInGB}"
    licenseType = "${var.licenseType}"
  }

  deployment_mode = "Incremental"
}
