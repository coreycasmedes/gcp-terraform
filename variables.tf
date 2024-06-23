variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "HCP_CLIENT_ID" {
    description = "hashicorp client id"
    type = string
}

variable "HCP_CLIENT_SECRET" {
  description = "hashicorp client secret"
  type        = string
}