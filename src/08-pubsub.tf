module "pubsub" {
  source   = "git::git@github.com:quarks-labs/gcp-pubsub-module.git"
  project                    = var.project
  name                       = lower("${var.name}-${random_string.random.result}")
  message_retention_duration = ""
  labels                     = {}
  message_storage_policy = {
    allowed_persistence_regions = []
  }
  schema_settings = {
    encoding = ""
    schema   = ""
  }
}
