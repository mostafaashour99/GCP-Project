#for cluster 
resource "google_compute_subnetwork" "private" {
  name                     = "restricted-subnet"
  ip_cidr_range            = "10.0.0.0/16"
  region                   = "us-central1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "k8s-pod-range"
    ip_cidr_range = "10.48.0.0/14"
  }
  secondary_ip_range {
    range_name    = "k8s-service-range"
    ip_cidr_range = "10.52.0.0/20"
  }
}

# for vms
resource "google_compute_subnetwork" "management-subnetwork" {
  name          = "management-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.main.id
  private_ip_google_access= true 
}