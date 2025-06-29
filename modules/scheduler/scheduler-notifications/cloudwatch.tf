# ==========================================================================
#  Module EC2 Scheduler-Notification: cloudwatch.tf
# --------------------------------------------------------------------------
#  Description:
#    CloudWatch Alarms
# --------------------------------------------------------------------------
#    - Scheduler Errors
# ==========================================================================

resource "aws_cloudwatch_metric_alarm" "scheduler_errors" {
  alarm_name          = "${var.prefix}-errors-${local.current_workspace}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = "300"
  statistic           = "Sum"
  threshold           = "0"
  alarm_description   = "EC2 scheduler errors detected for ${local.current_workspace} environment"
  alarm_actions       = [aws_sns_topic.scheduler_notifications["${local.current_workspace}"].arn]

  dimensions = {
    FunctionName = "${var.prefix}-function"
    Environment  = "${var.environment[local.env]}"
  }

  tags = merge(local.tags, {
      Name        = "${var.prefix}-errors-${local.current_workspace}"
      Service     = "cloudwatch-scheduler"
    }
  )
}