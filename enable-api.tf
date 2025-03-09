locals {
  apis_to_enable = [
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com"
  ]
}

resource "google_project_service" "api_services" {
  for_each = toset(local.apis_to_enable)

  project = var.project_id
  service = each.value
}
