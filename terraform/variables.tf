variable "project_id" {
  type = string
  description = "The ID of the project to create resources in"
}

variable "cluster_name" {
  type = string
}
variable "cluster_location" {
  type = string
}

# variable "bation-region" {
#   type = string
#   description = "The region to use"
# }
# variable "cluster-region" {
#   type = string
#   description = "The region to use"
# }
# variable "main_zone" {
#   type = string
#   description = "The zone to use as primary"
# }

# variable "cluster_node_zones" {
#   type = list(string)
#   description = "The zones where Kubernetes cluster worker nodes should be located"
# }
