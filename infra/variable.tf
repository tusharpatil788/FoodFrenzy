variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "location" {
  type    = string
  default = "centralindia"
}

variable "prefix" {
  type    = string
  default = "foodfrenzy98"
}

variable "acr_name" {
  type        = string
  description = "Globally unique, 5-50 chars, lowercase letters and numbers only"
}

variable "node_count" {
  type    = number
  default = 2
}

variable "vm_size" {
  type    = string
  default = "Standard_B2s"
}