locals {
  # Automatically load account-level variables
  local_vars = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl"))
}

include {
  path = find_in_parent_folders()
}

terraform {
  source = "../modules//cloud-run-no-auth"
  // source = "git::https://github.com/mgladson/Terraform-Modules-Chainlink.git//modules/gcp/ea-cloud-run-no-auth/"
}

inputs = {
  region          = local.local_vars.locals.region

  cloud_run_name  = "tf-ea-coingecko-3"
  cloud_run_image = "gcr.io/${local.local_vars.locals.project}/docker/coingecko-adapter:1.9.1"
  env_1_key       = "CACHE_ENABLED"
  env_1_value     = "true"
  env_2_key       = "EXPERIMENTAL_WARMUP_ENABLED"
  env_2_value     = "true"
  env_3_key       = "CACHE_MAX_AGE"
  env_3_value     = "60000"
  env_4_key       = "RATE_LIMIT_ENABLED"
  env_4_value     = "false"
  env_5_key       = "LOG_LEVEL"
  env_5_value     = "debug"
  env_6_key       = "API_VERBOSE"
  env_6_value     = "false"
}
