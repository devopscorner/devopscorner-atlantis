# ==========================================================================
#  Module EC2 Scheduler-Config: iam.tf
# --------------------------------------------------------------------------
#  Description:
#    Iam Role and Policy
# --------------------------------------------------------------------------
#    - Cross Account Scheduler
#    - Cross Account Scheduler Policy
# ==========================================================================

resource "aws_iam_role" "cross_account_scheduler" {
  name = "CrossAccountEC2SchedulerRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = var.aws_account_id_destination
        }
        Action = "sts:AssumeRole"
        Condition = {
          StringEquals = {
            "aws:PrincipalArn": "arn:aws:iam::${var.aws_account_id_destination}:role/${var.prefix}-lambda-role"
          }
        }
      }
    ]
  })

  tags = local.tags
}

resource "aws_iam_role_policy" "cross_account_scheduler" {
  name = "CrossAccountEC2SchedulerPolicy"
  role = aws_iam_role.cross_account_scheduler.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:DescribeInstances",
          "ec2:StartInstances",
          "ec2:StopInstances"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "ec2:CreateTags",
          "ec2:DeleteTags"
        ]
        Resource = "arn:aws:ec2:${var.aws_region}:${var.aws_account_id_destination}:instance/*"
        Condition = {
          StringEquals = {
            "aws:RequestTag/Scheduler": "true"
          }
        }
      }
    ]
  })
}
