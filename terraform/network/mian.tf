

resource "google_compute_network" "main" {
  name                            =  "kubernetes-cluster"
  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}
