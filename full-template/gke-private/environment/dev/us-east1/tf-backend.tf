terraform {
  backend "gcs" {
    bucket = "quarks-labs"
    prefix = "tfstate/us-east1"
  }
}