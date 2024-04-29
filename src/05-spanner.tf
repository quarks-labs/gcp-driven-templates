module "spanner" {
  count            = 0
  source           = "git::git@github.com:quarks-labs/gcp-spanner-instance-module.git"
  name             = lower("${var.name}-${random_string.random.result}")
  project          = var.project
  region           = "regional-us-east5"
  processing_units = 900
  databases = [{
    name                     = "quarks-labs"
    ddl                      = []
    deletion_protection      = false
    enable_drop_protection   = false
    version_retention_period = "3d"
  }]
  depends_on = [google_project_service.api]
}
