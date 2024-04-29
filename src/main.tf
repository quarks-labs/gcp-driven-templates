resource "random_string" "random" {
  length  = 3
  special = false
  numeric = false
}

resource "google_project_service" "api" {
  for_each = { for idx, api in var.apis : idx => api } 
  service = each.value
  project = var.project
  disable_dependent_services = false
}

