variable "cluster_name" {
  type = string
  description = "cluster_name"
}


variable "cluster_location" {
  type = string
  description = "cluster location"
}



variable "network_name" {
  type = string
  description = "The name of the app VPC"
}

variable "subnet_name" {
  type = string
  description = "The name of the app subnet"
}

variable "authorized_ipv4_cidr_block" {
  type = string
  description = "The CIDR block where HTTPS access is allowed from"
  default = null
}
