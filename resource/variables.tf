#
 variable "rg_name" {}
 variable "vnets" {
   
 }
#   description = "Name of the Resource Group"
#   type        = string
# }

# variable "location" {
#   description = "Azure region where the Resource Group will be created"
#   type        = string
#   default     = "eastus"
# }

variable "tags" {
  description = "Tags to apply to the Resource Group"
  type        = map(string)
  default     = {
    environment = "dev"
    project     = "avm-demo"
  }
}
