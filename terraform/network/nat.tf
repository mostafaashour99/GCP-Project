resource "google_compute_router" "router" {
  name    = "router"
  region  = google_compute_subnetwork.management-subnetwork.region
  network = google_compute_network.main.id
}

# resource "google_compute_address" "address" {
#   name   = "address"
#   region = google_compute_subnetwork.management-subnetwork.region
# }
# resource "google_compute_address" "nat" {
#   name         = "nat"
#   # address_type = "EXTERNAL"
#   # network_tier = "PREMIUM"
#   region = google_compute_subnetwork.management-subnetwork.region

# }

resource "google_compute_router_nat" "nat" {
  name   = "nat"
  router = google_compute_router.router.name
  region = google_compute_subnetwork.management-subnetwork.region

  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  # subnetwork {
  #   name = google_compute_subnetwork.management-subnetwork.id
  #   source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  # }
}
