locals {
  bucket   = "chainlink-external-adapters"
  project  = "chainlink-test-external-adapter"
  location = "us-west1"
  zone    = "us-west1-b"
}

# creates GCS bucket for storing states
remote_state {
  backend = "gcs"

  config = {
    bucket = local.bucket
    prefix = "${path_relative_to_include()}/terraform.tfstate"
    project = local.project
    location = local.region
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  required_version = ">= 1.2.4"
  backend "gcs" {}
}
provider "google" {
  project = "${local.project}"
  region  = "${local.region}"
  zone    = "${local.zone}"
}
EOF
}
