# ==========================================================================
#  Module EC2 Scheduler-Core: iam.tf
# --------------------------------------------------------------------------
#  Description:
#    Main Terraform Module
# --------------------------------------------------------------------------
#    - Scheduler Lambda Role
#    - Scheduler Lambda Policy
# ==========================================================================

resource "aws_iam_role" "scheduler_lambda" {
  name = "${var.prefix}-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  tags = local.tags
}

resource "aws_iam_role_policy" "scheduler_lambda" {
  name = "${var.prefix}-lambda-policy"
  role = aws_iam_role.scheduler_lambda.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "sts:AssumeRole",
          "ssm:GetParameter",
          "ssm:GetParameters",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "sns:Publish"
        ]
        Resource = [
          "arn:aws:iam::*:role/CrossAccountEC2SchedulerRole",
          "arn:aws:ssm:${var.aws_region}:*:parameter/${var.prefix}/*",
          "arn:aws:logs:${var.aws_region}:*:*",
          "arn:aws:sns:${var.aws_region}:*:${var.prefix}-*"
        ]
      }
    ]
  })
}