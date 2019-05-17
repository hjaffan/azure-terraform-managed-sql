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
}

variable "administratorLogin" {
    type = "string"
}

variable "administratorLoginPassword" {
    type = "string"
  
}
variable "location" {
  type = "string"
}

variable "virtualNetworkName" {
    type = "string"
}

variable "addressPrefix" {
  type = "string"
}

variable "subnetName" {
  type = "string"
}

variable "subnetPrefix" {
  type = "string"
}

variable "skuName" {
  type = "string"
}

variable "vCores" {
    type = "int"
}
variable "storageSizeInGB" {
  type = "string"
}

variable "licenseType" {
  type = "string"
}
