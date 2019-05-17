variable "resourceGroupName" {
    type = "string" 
}

variable "resourceGroupLocation" {
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
  description = "Enter location. If you leave this field blank resource group location would be used."
}

variable "virtualNetworkName" {
    type = "string"
    description = "Enter virtual network name. If you leave this field blank name will be created by the template."    
}

variable "addressPrefix" {
  type = "string"
  description = "Enter virtual network address prefix."
}

variable "subnetName" {
  type = "string"
  description = "Enter subnet name."
}

variable "subnetPrefix" {
  type = "string"
  description = "Enter subnet address prefix."
}

variable "skuName" {
  type = "string"
  description = "Enter sku name."
}

variable "vCores" {
    type = "int"
    description = "Enter number of vCores."
}
variable "storageSizeInGB" {
  type = "int"
  description = "Enter storage size."
}

variable "licenseType" {
  type = "string"
  description = "Enter license type."
}
