variable "logicAppName" {
    type = "string"
}

variable "testUri" {
    type = "string"
}

variable "location" {
    type = "string"
    description = "Enter location. If you leave this field blank resource group location would be used."
}

variable "logicAppResourceName" {
    type = "string"
}

variable "azurermResourceGroupName" {
    type = "string"
}
