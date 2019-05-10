resource "azurerm_resource_group" "test" {
  name     = "acctestRG-101"
  location = "West US"
}

resource "azurerm_template_deployment" "test" {
  name                = "acctesttemplate-101"
  resource_group_name = "${azurerm_resource_group.test.name}"

  template_body = <<DEPLOY
  {
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
      "sqlAdministratorLogin": {
        "type": "string",
        "metadata": {
          "description": "The administrator username of the SQL Server."
        }
      },
      "sqlAdministratorLoginPassword": {
        "type": "securestring",
        "metadata": {
          "description": "The administrator password of the SQL Server."
        }
      },
      "transparentDataEncryption": {
        "type": "string",
        "allowedValues": [
          "Enabled",
          "Disabled"
        ],
        "defaultValue": "Enabled",
        "metadata": {
          "description": "Enable or disable Transparent Data Encryption (TDE) for the database."
        }
      },
      "databaseName": {
        "type": "string",
        "metadata": {
          "description": "The name of the database."
        }
      },
      "location": {
        "type": "string",
        "defaultValue": "[resourceGroup().location]",
        "metadata": {
          "description": "Location for all resources."
        }
      },
      "databaseEdition": {
        "type": "string",
        "metadata": {
          "description": "Database Edition."
        }
      },
      "databaseCollation": {
        "type": "string",
        "metadata": {
          "description": "Database Collation Setting."
        }
      }
    },
    "variables": {
      "sqlServerName": "[concat('sqlserver', uniqueString(subscription().id, resourceGroup().id))]",
      "databaseServiceObjectiveName": "Basic"
    },
    "resources": [
      {
        "name": "[variables('sqlServerName')]",
        "type": "Microsoft.Sql/servers",
        "apiVersion": "2014-04-01-preview",
        "location": "[parameters('location')]",
        "tags": {
          "displayName": "SqlServer"
        },
        "properties": {
          "administratorLogin": "[parameters('sqlAdministratorLogin')]",
          "administratorLoginPassword": "[parameters('sqlAdministratorLoginPassword')]",
          "version": "12.0"
        },
        "resources": [
          {
            "name": "[parameters('databaseName')]",
            "type": "databases",
            "apiVersion": "2015-01-01",
            "location": "[parameters('location')]",
            "tags": {
              "displayName": "Database"
            },
            "properties": {
              "edition": "[parameters('databaseEdition')]",
              "collation": "[parameters('databaseCollation')]",
              "requestedServiceObjectiveName": "[variables('databaseServiceObjectiveName')]"
            },
            "dependsOn": [
              "[variables('sqlServerName')]"
            ],
            "resources": [
              {
                "comments": "Transparent Data Encryption",
                "name": "current",
                "type": "transparentDataEncryption",
                "apiVersion": "2014-04-01-preview",
                "properties": {
                  "status": "[parameters('transparentDataEncryption')]"
                },
                "dependsOn": [
                  "[parameters('databaseName')]"
                ]
              }
            ]
          },
          {
            "name": "AllowAllMicrosoftAzureIps",
            "type": "firewallrules",
            "apiVersion": "2014-04-01",
            "location": "[parameters('location')]",
            "properties": {
              "endIpAddress": "0.0.0.0",
              "startIpAddress": "0.0.0.0"
            },
            "dependsOn": [
              "[variables('sqlServerName')]"
            ]
          }
        ]
      }
    ],
    "outputs": {
      "sqlServerFqdn": {
        "type": "string",
        "value": "[reference(concat('Microsoft.Sql/servers/', variables('sqlServerName'))).fullyQualifiedDomainName]"
      },
      "databaseName": {
        "type": "string",
        "value": "[parameters('databaseName')]"
      }
    }
  }
  DEPLOY

  # these key-value pairs are passed into the ARM Template's `parameters` block
  parameters = {
    "databaseName" = "${var.databaseName}"
    "sqlAdministratorLogin" = "${var.sqlAdministratorLogin}"
    "sqlAdministratorLoginPassword" = "${var.sqlAdministratorLoginPassword}"
    "transparentDataEncryption" = "${var.transparentDataEncryption}"
    "databaseEdition" = "${var.databaseEdition}"
    "databaseCollation" = "${var.databaseCollation}"
  }

  deployment_mode = "Incremental"
}
