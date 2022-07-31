locals {
  bucket = "chainlink-external-adapters"
  project = "chainlink-test-external-adapter"
  location = "us-west1"
}

# creates GCS bucket for storing states
remote_state {
  backend = "gcs"

  config = {
    bucket = local.bucket
    prefix = "${path_relative_to_include()}/terraform.tfstate"
    project = local.project
    location = local.location
  }
}
