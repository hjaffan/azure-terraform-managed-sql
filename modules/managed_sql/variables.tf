variable "sqlAdministratorLogin" {
    type = "string"
    default = "GEN-UNIQUE"
}

variable "sqlAdministratorLoginPassword" {
    type = "string"
    default = "SDfasdflkj@!"
}

variable "transparentDataEncryption" {
    type = "string"
    default = "Disabled"
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
    default = "SQL_Latin1_General_CP1_CI_AS"
}

variable "databaseServiceObjectiveName" {
    type = "string"
    default = ""
}