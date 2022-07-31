terraform {
  backend "gcs" {}
}

module "gcp-cloud-run-coingecko-noauth" {
  source = "../modules/cloud-run-no-auth"

# https://www.terraform.io/language/modules/sources#generic-git-repository
#   source = "git::https://github.com/mgladson/Terragrunt-Chainlink-External-Adapter-GCP-Cloud-Run.git//modules/gcp-cloud-run-no-auth"

  cloud_run_name  = var.cloud_run_name
  cloud_run_image = var.cloud_run_image
  env_1_key       = var.env_1_key
  env_1_value     = var.env_1_value  
  env_2_key       = var.env_2_key
  env_2_value     = var.env_2_value  
  env_3_key       = var.env_3_key
  env_3_value     = var.env_3_value  
  env_4_key       = var.env_4_key
  env_4_value     = var.env_4_value  
  env_5_key       = var.env_5_key
  env_5_value     = var.env_5_value  
  env_6_key       = var.env_6_key
  env_6_value     = var.env_6_value  

}
