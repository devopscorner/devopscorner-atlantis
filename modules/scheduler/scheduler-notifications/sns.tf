# ==========================================================================
#  Module EC2 Scheduler-Notification: sns.tf
# --------------------------------------------------------------------------
#  Description:
#   SNS topics for EC2 Scheduler notifications
# --------------------------------------------------------------------------
#    - SNS Notifications
#    - SNS Encryption
#    - SNS Schedule Notifications
#    - SNS Schedule Email Subscriptions
# ==========================================================================

# Script to create SNS topics for EC2 Scheduler notifications
resource "aws_sns_topic" "scheduler_notifications" {
  name = "ec2-scheduler-notifications-${var.workspace_env[local.env]}"

  tags = merge(local.tags, {
      Name        = "ec2-scheduler-notifications-${var.workspace_env[local.env]}"
      Service     = "ec2-scheduler"
    }
  )
}

# Including KMS encryption for the SNS topics
resource "aws_kms_key" "sns_encryption" {
  description             = "KMS key for SNS topic encryption"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = merge(local.tags, {
      Name        = "ec2-scheduler-sns-key-${var.workspace_env[local.env]}"
      Service     = "ec2-scheduler"
    }
  )
}

# Adding topic policy to allow publishing from the scheduler Lambda
resource "aws_sns_topic_policy" "scheduler_notifications" {
  for_each = aws_sns_topic.scheduler_notifications

  arn = each.value.arn
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowLambdaPublishing"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action   = "sns:Publish"
        Resource = each.value.arn
      }
    ]
  })
}

resource "aws_sns_topic_subscription" "email" {
  for_each = {
    for item in flatten([
      for env, emails in var.notification_emails : [
        for email in emails : {
          env   = env
          email = email
        }
      ]
    ]) : "${item.env}-${item.email}" => item
  }

  topic_arn = aws_sns_topic.scheduler_notifications[each.value.env].arn
  protocol  = "email"
  endpoint  = each.value.email
}
