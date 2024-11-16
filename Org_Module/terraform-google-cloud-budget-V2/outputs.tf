

output "budget_name" {
    value = google_billing_budget.budget.display_name
}
output "budget_amount" {
    value = google_billing_budget.budget.amount
}
output "budget_project" {
    value = google_billing_budget.budget.budget_filter[0].projects
}
output "budget_threshold" {
    value = google_billing_budget.budget.threshold_rules
}
/* output "monitoring_notification_channels" {
  value = google_billing_budget.budget.monitoring_notification_channels
} */