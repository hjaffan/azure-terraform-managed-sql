resource "azurerm_template_deployment" "default" {
  name                = "${var.logicAppResourceName}"
  resource_group_name = "${var.azurermResourceGroupName}"

  template_body = <<DEPLOY
  {
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "logicAppName": {
            "type": "string",
            "metadata": {
                "description": "The name of the logic app to create."
            }
        },
        "testUri": {
            "type": "string",
            "defaultValue": "http://azure.microsoft.com/en-us/status/feed/",
            "metadata": {
                "description": "A test URI"
            }
        },
        "location": {
            "type": "string",
            "defaultValue": "[resourceGroup().location]",
            "metadata": {
                "description": "Location for all resources."
            }
        }
    },
    "variables": {},
    "resources": [
    {
      "type": "Microsoft.Logic/workflows",
      "apiVersion": "2016-06-01",
      "name": "[parameters('logicAppName')]",
      "location": "[parameters('location')]",
      "tags": {
        "displayName": "LogicApp"
      },
      "properties": {
        "definition": {
          "$schema": "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#",
          "contentVersion": "1.0.0.0",
          "parameters": {
            "testUri": {
              "type": "string",
              "defaultValue": "[parameters('testUri')]"
            }
          },
          "triggers": {
            "recurrence": {
              "type": "recurrence",
              "recurrence": {
                "frequency": "Hour",
                "interval": 1
              }
            }
          },
          "actions": {
            "http": {
              "type": "Http",
              "inputs": {
                "method": "GET",
                "uri": "@parameters('testUri')"
              },
              "runAfter": {}
            }
          },
          "outputs": {}
        },
        "parameters": {}
      }
    }
  ]
  }
  DEPLOY

  # these key-value pairs are passed into the ARM Template's `parameters` block
  parameters = {
    logicAppName = "${var.logicAppName}"
    testUri = "${var.testUri}"
    location = "${var.location}"
  }

  deployment_mode = "Incremental"
}
