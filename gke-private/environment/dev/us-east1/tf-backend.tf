terraform {
  backend "gcs" {
    bucket = "quarks-labs"
    prefix = "tfstate/quarks-labs/us-east1"
  }
}