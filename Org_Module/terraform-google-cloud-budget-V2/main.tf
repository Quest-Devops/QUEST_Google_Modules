/******************************************
  Google Cloud Billing Budget Quota
 *****************************************/
resource "google_billing_budget" "budget" {
    amount                                {
    dynamic "specified_amount"            {
      for_each                            = var.specified_amount[*]
      content                             {
        currency_code                     = lookup(specified_amount.value , "currency_code" , "")
        units                             = lookup(specified_amount.value , "units" , "")
        nanos                             = lookup(specified_amount.value , "nanos" , "")
      }
    }
    last_period_amount                    = var.last_period_amount
  }
  billing_account                         = var.billing_account_id
  display_name                            = var.budget_name
  dynamic "budget_filter"                 {
    for_each                              = var.budget_filter[*]
    content                               {
      projects                            = lookup(budget_filter.value, "projects" ,"")
      resource_ancestors                  = lookup(budget_filter.value, "resource_ancestors" ,"")
      credit_types_treatment              = lookup(budget_filter.value, "credit_types_treatment" ,"")
      services                            = lookup(budget_filter.value, "services" ,"")
      credit_types                        = lookup(budget_filter.value, "credit_types" ,"")
      subaccounts                         = lookup(budget_filter.value, "subaccounts" ,"")
      labels                              = lookup(budget_filter.value, "labels" ,"")
      calendar_period                     = lookup(budget_filter.value, "calendar_period" ,"")
      dynamic "custom_period"             {
        for_each                          = lookup(budget_filter.value, "custom_period" ,"")
        content                           {
          dynamic "start_date"            {
            for_each                      = lookup(custom_period.value, "start_date" ,"")
            content                       {
              year                        = lookup(start_date.value, "year" ,"")
              month                       = lookup(start_date.value, "month" ,"")
              day                         = lookup(start_date.value, "day" ,"")
            }
          }
          dynamic "end_date"              {
            for_each                      = lookup(custom_period.value, "end_date" ,"")
            content                       {
              year                        = lookup(end_date.value, "year","")
              month                       = lookup(end_date.value, "month","")
              day                         = lookup(end_date.value, "day","")
            }
          }
        }
      }
      
    }
  }


  dynamic "threshold_rules"              {
    for_each                             = var.threshold_rules[*]
    content                              {
      threshold_percent                  = lookup(threshold_rules.value, "threshold_percent" , "" )
      spend_basis                        = lookup(threshold_rules.value, "spend_basis" , "" )
    }
  }
  dynamic "all_updates_rule"             {
    for_each                             = var.all_updates_rule[*]
    content                              {
      pubsub_topic                       = lookup(all_updates_rule.value, "pubsub_topic", "") 
      schema_version                     = lookup(all_updates_rule.value, "schema_version", "")
      monitoring_notification_channels   = [google_monitoring_notification_channel.budget_notify.id,]
      disable_default_iam_recipients     = lookup(all_updates_rule.value, "disable_default_iam_recipients", "")
    }
  }
  ownership_scope                        = var.ownership_scope


}
resource "google_monitoring_notification_channel" "budget_notify" {
  display_name                           = var.budget_notify_name
  type                                   = "email"
  labels                                 = {
    email_address                        = var.email_address
  }
  
}
