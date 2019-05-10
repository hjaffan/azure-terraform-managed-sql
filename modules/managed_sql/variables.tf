variable "resourceGroupName" {
    type = "string" 
}

variable "resourceGroupLocation" {
    type = "string"
}
variable "sqlAdministratorLogin" {
    type = "string"
    default = "terraform-user"
}

variable "databaseName" {
    type = "string"
}
variable "sqlAdministratorLoginPassword" {
    type = "string"
}

variable "transparentDataEncryption" {
    type = "string"
    default = "Disabled"
}

variable "databaseEdition" {
    type = "string"
    default = ""
}

variable "databaseCollation" {
    type = "string"
    default = "SQL_Latin1_General_CP1_CI_AS"
}

variable "databaseServiceObjectiveName" {
    type = "string"
    default = "Basic"
}