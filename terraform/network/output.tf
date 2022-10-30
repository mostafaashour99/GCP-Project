output "network" {
  value       = google_compute_network.main
  description = "The VPC"
}

output "subnet" {
  value       = google_compute_subnetwork.private
  description = "The subnet"
}
output "bastion-subnet" {
  value       = google_compute_subnetwork.management-subnetwork
  description = "The subnet"
}