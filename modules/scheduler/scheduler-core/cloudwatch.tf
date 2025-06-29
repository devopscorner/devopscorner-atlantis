# ==========================================================================
#  Module EC2 Scheduler-Core: cloudwatch.tf
# --------------------------------------------------------------------------
#  Description:
#    CloudWatch Resources
# --------------------------------------------------------------------------
#    - Scheduler CloudWatch Log Group
#    - Scheduler CloudWatch Event Rule
#    - Scheduler CloudWatch Event Target
#    - Scheduler CloudWatch Lambda Permission
# ==========================================================================

resource "aws_cloudwatch_log_group" "scheduler" {
  name              = "/aws/lambda/${local.lambda_function_name}"
  retention_in_days = 30
  tags              = local.tags
}

resource "aws_cloudwatch_event_rule" "scheduler" {
  name                = "${var.prefix}-trigger"
  description         = "Triggers EC2 scheduler Lambda function"
  schedule_expression = "rate(1 hour)"
  tags                = local.tags
}

resource "aws_cloudwatch_event_target" "scheduler" {
  rule      = aws_cloudwatch_event_rule.scheduler.name
  target_id = "${var.prefix}-lambda"
  arn       = aws_lambda_function.scheduler.arn
}

resource "aws_lambda_permission" "cloudwatch" {
  statement_id  = "AllowCloudWatchTrigger"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.scheduler.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.scheduler.arn
}
