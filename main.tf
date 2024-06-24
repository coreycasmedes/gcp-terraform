resource "random_string" "project_suffix" {
    length = 4
    special = false
    upper = false
    numeric = true
}

resource "google_project" "openmetadata_project" {
  name       = "openmetadata-dev-${random_string.project_suffix.result}"
  project_id = "openmetadata"

  labels = {
    environment = "dev"
  }
}