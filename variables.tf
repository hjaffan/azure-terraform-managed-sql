variable "sqlAdministratorLogin" {
    type = "string"
    default = "GEN-UNIQUE"
}

variable "sqlAdministratorLoginPassword" {
    type = "string"
    default = "GEN-PASSWORD"
}

variable "transparentDataEncryption" {
    type = "string"
    default = "false"
}

variable "resourceGroupName" {
    type = "string" 
}

variable "resourceGroupLocation" {
    type = "string"
}

variable "databaseName" {
    type = "string"
}

variable "databaseEdition" {
    type = "string"
}

variable "databaseCollation" {
    type = "string"
}

variable "databaseServiceObjectiveName" {
    type = "string"
}