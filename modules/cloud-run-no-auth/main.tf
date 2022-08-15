#check your terraform version via "terraform --version"
terraform {
  required_version = ">= 1.2.4"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service#example-usage---cloud-run-service-multiple-environment-variables
resource "google_cloud_run_service" "default" {
  name     = var.cloud_run_name
  location = var.region

  template {
    spec {
      containers {
        image   = var.cloud_run_image
        env {
          name  = var.env_1_key
          value = var.env_1_value
        }
        env {
          name  = var.env_2_key
          value = var.env_2_value
        }
        env {
          name  = var.env_3_key
          value = var.env_3_value
        }
        env {
          name  = var.env_4_key
          value = var.env_4_value
        }
        env {
          name  = var.env_5_key
          value = var.env_5_value
        }
        env {
          name  = var.env_6_key
          value = var.env_6_value
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
  autogenerate_revision_name = true

}

data "google_iam_policy" "noauth" {
  binding {
    role    = "roles/run.admin"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.default.location
  project     = google_cloud_run_service.default.project
  service     = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
