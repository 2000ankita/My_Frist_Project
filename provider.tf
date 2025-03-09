provider "google" {
  credentials = file("service-account-key.json") # Path to your service account key file
  project     = var.project_id
  region      = var.region
}
