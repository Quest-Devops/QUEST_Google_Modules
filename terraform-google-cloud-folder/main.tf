# Top-level folder under an organization.

resource "google_folder" "folder" {
  display_name        = var.folder_name
  parent              = var.parent
  tags                = var.tags
  deletion_protection = var.deletion_protection
}