variable "region" {
  type = string
  description = "The region to use"
}

variable "zone" {
  type = string
  description = "The zone where the Bastion host is located in."
}

variable "bastion_name" {
  type = string
  description = "The name to use for the bastion instance."
}

variable "network_name" {
  type = string
  description = "The name of the network that should be used."
}

variable "subnet_name" {
  type = string
  description = "The name of the subnet that should be used."
}