################################################################################
# NETWORK
################################################################################


module "network" {
  source                  = "git::git@github.com:quarks-labs/gcp-network-module.git"
  region                  = var.region
  name                    = lower("${var.name}-${random_string.random.result}")
  project                 = var.project
  auto_create_subnetworks = true
  subnetworks             = var.subnetworks
  depends_on = [ google_project_service.api ]
}