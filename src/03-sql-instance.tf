
module "database_instance" {
  count = 0
  source              = "git::git@github.com:quarks-labs/gcp-sql-database-instance-module.git"
  project             = var.project
  region              = var.region
  name                = lower("${var.name}-${random_string.random.result}")
  database_version    = "POSTGRES_14"
  deletion_protection = false

  private_network = {
    enabled = false
  }

  databases = [{
    name = "quarks-labs"
  }]
  users = [{
    name     = "quarks",
    password = "quarks@2057"
  }]
  settings = {
    disk_size = "20"
    tier      = "db-f1-micro"
    disk_type = "PD_SSD"
    data_cache_config = {
      data_cache_enabled = false
    }
    ip_configuration = {
      ipv4_enabled = true
      authorized_networks = [{
        name  = "allow-all",
        range = "0.0.0.0/0"
      }]
    }
  }
  depends_on = [  google_project_service.api ]
}
