resource "aws_cloudwatch_event_rule" "outside_businss_hours" {
  name        = "OutsideBusinessHours"
  description = "Schedule Expression evaluating to overnight"

  schedule_expression = "cron(0 1 * * ? *)"
}

resource "aws_cloudwatch_event_rule" "inside_business_hours" {
  name        = "InsideBusinessHours"
  description = "Schedule Expression evaluating to start of day"

  schedule_expression = "cron(0 6 * * ? *)"
}