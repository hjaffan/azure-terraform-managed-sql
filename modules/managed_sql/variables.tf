variable "azurermResourceGroupName" {
    type = "string"
}

variable "networkName" {
  type = "string"
}

variable "databaseResourceName" {
  type = "string"
  default = "managed_sql_deployment"
}

// Managed Insance Variables
variable "managedInstanceName" {
  type = "string"
  description = "Enter managed instance name."
}

variable "administratorLogin" {
    type = "string"
    description = "Enter user name."
}

variable "administratorLoginPassword" {
    type = "string"
    description = "Enter password."
}
variable "location" {
  type = "string"
  default = ""
  description = "Enter location. If you leave this field blank resource group location would be used."
}

variable "skuName" {
  type = "string"
  default = "GP_Gen4"
  description = "Enter sku name."
}

variable "vCores" {
    type = "string"
    default = "8"
    description = "Enter number of vCores."
}
variable "storageSizeInGB" {
  type = "string"
  default = "32"
  description = "Enter storage size."
}

variable "licenseType" {
  type = "string"
  default = "LicenseIncluded"
  description = "Enter license type."
}
