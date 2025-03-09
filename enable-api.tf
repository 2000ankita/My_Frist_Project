locals {
  apis_to_enable = [
    "compute.googleapis.com",
    "storage.googleapis.com"
  ]
}

resource "google_project_service" "cloud_resource_manager" {
  project = var.project_id
  service = "cloudresourcemanager.googleapis.com"
}

resource "google_project_service" "api_services" {
  for_each = toset(local.apis_to_enable)

  project = var.project_id
  service = each.value

  depends_on = [google_project_service.cloud_resource_manager]  # Ensures Cloud Resource Manager API is enabled first
}
