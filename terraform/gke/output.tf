output "name" {
  value = google_container_cluster.primary.name
  description = "The Kubernetes cluster name."
}