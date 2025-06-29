# ==========================================================================
#  Module EC2 Scheduler-Core: lambda.tf
# --------------------------------------------------------------------------
#  Description:
#
# --------------------------------------------------------------------------
#    - Scheduler CloudWatch Log Group
#    - Scheduler CloudWatch Event Rule
#    - Scheduler CloudWatch Event Target
#    - Scheduler CloudWatch Lambda Permission
# ==========================================================================

locals {
  lambda_function_name = "${var.prefix}-function"
}

resource "aws_lambda_function" "scheduler" {
  filename         = "${path.module}/lambda/scheduler.zip"
  function_name    = local.lambda_function_name
  role            = aws_iam_role.scheduler_lambda.arn
  handler         = "scheduler.lambda_handler"
  runtime         = "python3.9"
  timeout         = var.lambda_timeout
  memory_size     = var.lambda_memory

  environment {
    variables = {
      CONFIG_PREFIX = "/${var.prefix}"
      REGION       = var.aws_region
    }
  }

  tags = local.tags
}
