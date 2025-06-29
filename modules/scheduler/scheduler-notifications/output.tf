# ==========================================================================
#  Module EC2 Scheduler-Notification: output.tf
# --------------------------------------------------------------------------
#  Description:
#    Output variables for the EC2 Scheduler-Notification module
# --------------------------------------------------------------------------
#    - Topic ARNs
#    - Alarm ARNs
#    - Subscription ARNs
# ==========================================================================

output "topic_arns" {
  description = "Map of environment to SNS topic ARNs"
  value       = { for k, v in aws_sns_topic.scheduler_notifications : k => v.arn }
}

output "alarm_arns" {
  description = "Map of environment to CloudWatch Alarm ARNs"
  value       = { for k, v in aws_cloudwatch_metric_alarm.scheduler_errors : k => v.arn }
}

output "subscription_arns" {
  description = "Map of subscriptions to their ARNs"
  value       = { for k, v in aws_sns_topic_subscription.email : k => v.arn }
}