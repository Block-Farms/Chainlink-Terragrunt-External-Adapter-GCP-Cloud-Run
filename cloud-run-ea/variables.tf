#GCP Provider Variables
variable "project_id" {
  type        = string
  description = "The Google Cloud Project Id"
}

variable "region" {
  type    = string
  default = "us-west1"
}

variable "zone" {
  type    = string
  default = "us-west1-b"
}

variable "cloud_run_name" {
  type    = string
}

variable "cloud_run_image" {
  type    = string
}

variable "env_1_key" {
  type    = string
}

variable "env_1_value" {
  type    = string
}

variable "env_2_key" {
  type    = string
}

variable "env_2_value" {
  type    = string
}

variable "env_3_key" {
  type    = string
}

variable "env_3_value" {
  type    = string
}

variable "env_4_key" {
  type    = string
}

variable "env_4_value" {
  type    = string
}

variable "env_5_key" {
  type    = string
}

variable "env_5_value" {
  type    = string
}

variable "env_6_key" {
  type    = string
}

variable "env_6_value" {
  type    = string
}