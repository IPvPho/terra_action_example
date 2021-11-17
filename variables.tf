variable "rg" {
  type = object({
    name     = string
    location = string
    tags = object({
      Owner = string
    })
  })
}

variable "lab_sub_id" {}

variable "stgaccounts" {
  description = "Data values for storage accounts"
}

variable "containers" {
  description = "Data values for storage account containers"
}

variable "rgs" {
  description = "Data values for our resource group creation"
}
variable "vnets" {
  description = "Data values for virtual network creation"
}

variable "peers" {
  description = "Data values for virtual network peering"
}
variable "params" {
  description = "Data values for params"
}