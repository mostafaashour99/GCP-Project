resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
resource "google_compute_route" "egress_internet" {
  name             = "egress-internet"
  dest_range       = "0.0.0.0/0"
  network          = google_compute_network.main.name
  next_hop_gateway = "default-internet-gateway"
}