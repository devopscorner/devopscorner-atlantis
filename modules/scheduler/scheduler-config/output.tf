# ==========================================================================
#  Module EC2 Scheduler-Config: output.tf
# --------------------------------------------------------------------------
#  Description:
#    Outputs for the EC2 Scheduler Configuration Module
# --------------------------------------------------------------------------
#    - Cross Account Role ARN
#    - Parameter ARNs
#    - Schedule Configurations
# ==========================================================================

output "cross_account_role_arn" {
  description = "ARN of the cross-account scheduler role"
  value       = aws_iam_role.cross_account_scheduler.arn
}

output "parameter_arns" {
  description = "ARNs of created SSM parameters"
  value       = { for k, v in aws_ssm_parameter.environment_schedules : k => v.arn }
}

output "schedule_configurations" {
  description = "Map of environment schedule configurations"
  value       = var.environment_schedules
}