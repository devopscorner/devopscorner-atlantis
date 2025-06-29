# ==========================================================================
#  Module EC2 Scheduler-Core: ssm.tf
# --------------------------------------------------------------------------
#  Description:
#    SSM Parameter Store
# --------------------------------------------------------------------------
#    - Lambda Config
# ==========================================================================

resource "aws_ssm_parameter" "lambda_config" {
  name  = "/${var.prefix}/lambda-config"
  type  = "SecureString"
  value = jsonencode({
    region         = var.aws_region
    function_name  = aws_lambda_function.scheduler.function_name
    log_group_name = aws_cloudwatch_log_group.scheduler.name
  })
  tags  = local.tags
}