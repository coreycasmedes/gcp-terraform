terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.30.0"
    }
    hcp = {
      source = "hashicorp/hcp"
      version = "0.91.0"
    }
  }
}

provider "hcp" {
  client_id  = var.HCP_CLIENT_ID
  client_secret = var.HCP_CLIENT_SECRET
}

data "hcp_vault_secrets_secret" "gcp_sa_key" {
  app_name = "vault"
  secret_name = "gcp_sa_key"
}

provider "google" {
  credentials = data.hcp_vault_secrets_secret.gcp_sa_key.secret_value
  project     = "terraform-admin-427219"  # bootstrap project ID
  region      = var.region
}