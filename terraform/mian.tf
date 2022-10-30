provider "google" {
  project = "mostafa-ashour-project"
}

module "google_networks" {
  source = "./network"

}

module "google_kubernetes_cluster" {
  source = "./gke"
  cluster_name = var.cluster_name
  cluster_location = var.cluster_location
  network_name               = module.google_networks.network.self_link
  subnet_name                = module.google_networks.subnet.name
  authorized_ipv4_cidr_block = "${module.bastion.ip}/32"
}

module "bastion" {
  source = "./bastion"

  region       = module.google_networks.bastion-subnet.region
  zone         = "us-central1-a"
  bastion_name = "app-cluster"
  network_name = module.google_networks.network.name
  subnet_name  = module.google_networks.bastion-subnet.name
  }