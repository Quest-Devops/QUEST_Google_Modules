resource "google_monitoring_group" "monitoring_group" {
    project                 = var.project
    display_name            = var.display_name
    filter                  = var.filter
    parent_name             = var.parent_name
    is_cluster              = var.is_cluster
}