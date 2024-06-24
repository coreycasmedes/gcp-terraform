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

provider "hcp" {}

data "hcp_vault_secrets_secret" "gcp_sa_key" {
  app_name = "vault"
  secret_name = "gcp_sa_key"
}

provider "google" {
  credentials = data.hcp_vault_secrets_secret.gcp_sa_key.secret_value
  project     = "terraform-admin-427219"  # bootstrap project ID
  region      = var.region
}