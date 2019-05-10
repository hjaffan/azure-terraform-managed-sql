variable "sqlAdministratorLogin" {
    type = "string"
    default = "GEN-UNIQUE"
}

variable "sqlAdministratorLoginPassword" {
    type = "securestring"
    default = "SDfasdflkj@!"
}

variable "transparentDataEncryption" {
    type = "string"
    default = "Disabled"
}

# variable "resourceGroupName" {
#     type = "string" 
# }

# variable "resourceGroupLocation" {
#     type = "string"
# }

variable "databaseName" {
    type = "string"
}

# variable "databaseEdition" {
#     type = "string"
# }

# variable "databaseCollation" {
#     type = "string"
# }

# variable "databaseServiceObjectiveName" {
#     type = "string"
# }