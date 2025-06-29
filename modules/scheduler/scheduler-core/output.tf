# ==========================================================================
#  Module EC2 Scheduler-Core: output.tf
# --------------------------------------------------------------------------
#  Description:
#    Output variables for the EC2 Scheduler-Core module
# --------------------------------------------------------------------------
#    - Lambda Role ARN
#    - Lambda Function ARN
#    - Lambda Function Name
#    - CloudWatch Log Group Name
# ==========================================================================

output "lambda_role_arn" {
  description = "ARN of the Lambda IAM role"
  value       = aws_iam_role.scheduler_lambda.arn
}

output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = aws_lambda_function.scheduler.arn
}

output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = aws_lambda_function.scheduler.function_name
}

output "cloudwatch_log_group_name" {
  description = "Name of the CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.scheduler.name
}