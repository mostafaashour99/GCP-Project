resource "google_project_service" "compute" {
      disable_on_destroy = true 
      project            = "mostafa-ashour-project"
      service            = "compute.googleapis.com" 
    }
resource "google_service_account" "vms" {
  account_id   = "serviceaccountidforvms2"
  display_name = "Service Account"
}

resource "google_project_iam_binding" "admin-account-iam" {
  project = "mostafa-ashour-project"
  role    = "roles/container.admin"

  members = [
    "serviceAccount:${google_service_account.vms.email}",
  ]
}

resource "google_compute_address" "address" {
  name   = "address"
  region = var.region
}

resource "google_compute_instance" "bastion" {
  name         = var.bastion_name
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = var.network_name
    subnetwork = var.subnet_name

    # access_config {
    #     nat_ip = "${google_compute_address.address.address}"
    
    # }
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.vms.email
    scopes = ["cloud-platform"]
  }
}