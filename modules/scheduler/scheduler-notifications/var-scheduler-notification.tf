# ==========================================================================
#  Module EC2 Scheduler-Notification: scheduler-notification.tf
# --------------------------------------------------------------------------
#  Description:
#    Variables for the EC2 Scheduler-Notification module
# --------------------------------------------------------------------------
#    - Prefix
#    - Notification Emails
# ==========================================================================

variable "prefix" {
  description = "Resource name prefix"
  type        = string
  default     = "ec2-scheduler"
}

variable "notification_emails" {
  description = "Map of environment to list of email addresses for notifications"
  type        = map(list(string))
}
