
module "module" {
  count = 0
  source                  = "git::git@github.com:quarks-labs/gcp-redis-instance-module.git"
  project                 = var.project
  region                  = var.region
  name                    = var.name
  display_name            = var.name
  location_id             = "us-east1-b"
  tier                    = "STANDARD_HA"
  reserved_ip_range       = "10.3.0.0/27"
  auth_enabled            = false
  authorized_network      = "default"
  transit_encryption_mode = "DISABLED"
  memory_size_gb          = 1
  redis_version           = "REDIS_4_0"
  depends_on = [  google_project_service.api ]
}

