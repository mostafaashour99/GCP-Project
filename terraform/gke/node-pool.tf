resource "google_service_account" "kubernetes" {
  account_id = "kubernetes"
}

resource "google_project_iam_binding" "admin-account-iam" {
  project = "mostafa-ashour-project"
  role    = "roles/storage.objectViewer"

  members = [
    "serviceAccount:${google_service_account.kubernetes.email}",
  ]
}
resource "google_container_node_pool" "general" {
  name       = "general"
  cluster    = google_container_cluster.primary.name
  node_count = 1
  location       = google_container_cluster.primary.location

  management {
    auto_repair  = true
    auto_upgrade = true
  }
   autoscaling {
    max_node_count = 1
    min_node_count = 1
  }

  upgrade_settings {
    max_surge       = 1
    max_unavailable = 1
  }
  
  
  node_config {
    preemptible  = true
    disk_size_gb = 10

    labels = {
      role = "general"
    }

    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append",
    ]
  }
}

resource "google_container_node_pool" "spot" {
  name    = "spot"
  cluster = google_container_cluster.primary.id

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = 0
    max_node_count = 10
  }

  node_config {
    preemptible  = true
    machine_type = "e2-small"



    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
