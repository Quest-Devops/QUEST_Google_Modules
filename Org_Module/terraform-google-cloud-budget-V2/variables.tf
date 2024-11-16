variable "specified_amount"        {
  description                      = "A specified amount to use as the budget."
  type                             = list(object({
    currency_code                  = string
    units                          = number
    nanos                          = number
  }))
}
variable "last_period_amount"      {
  description                      = " Configures a budget amount that is automatically set to 100% of last period's spend. Boolean. Set value to true to use. Do not set to false, instead use the specified_amount block."
  type                             = bool
  
}
variable "billing_account_id"      {
  description                      = "The billing account id setting the budget"
  type                             = string
}     

variable "budget_name"              {
  description                       = "The name of the budget quota to be allowed"
  type                              = string
}
variable "budget_filter"            {
  description                       = "Filters that define which resources are used to compute the actual spend against the budget"
  type                              = list(object({
    projects                        = list(string)
    resource_ancestors              = list(string)
    credit_types_treatment          = string
    services                        = list(string)
    credit_types                    = list(string)
    subaccounts                     = list(string)
    labels                          = map(string)
    calendar_period                 = string
    custom_period                   = list(object({
      start_date                    = list(object({
        year                        = number
        month                       = number
        day                         = number
      }))
      end_date                      = list(object({
        year                        = number
        month                       = number
        day                         = number
      }))
    }))
  }))
}
variable "threshold_rules"           {
  description                        = "Send an alert when this threshold is exceeded. This is a 1.0-based percentage, so 0.5 = 50%. Must be >= 0."
  type                               = list(object({
    threshold_percent                = number
    spend_basis                      = string
  }))
}
variable "all_updates_rule"          {
  description                        = "Defines notifications that are sent on every update to the billing account's spend, regardless of the thresholds defined using threshold rules."
  type                               = list(object({
    pubsub_topic                     = string
    schema_version                   = string
    #monitoring_notification_channels = list(string)
    disable_default_iam_recipients   = bool
  }))
}
variable "ownership_scope"           {
  description                        = "The ownership scope of the budget. The ownership scope and users' IAM permissions determine who has full access to the budget's data."
  type                               = string
}
variable "budget_notify_name"       {
  description                       = "The name of the budget notification for email"
  type                              = string
}
variable "email_address"           {
  description                      = "The email address to whom budget notification to be sent"
  type                             = string
  
}
