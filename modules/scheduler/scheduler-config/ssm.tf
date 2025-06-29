# ==========================================================================
#  Module EC2 Scheduler-Config: ssm.tf
# --------------------------------------------------------------------------
#  Description:
#    SSM Parameter Store
# --------------------------------------------------------------------------
#    - Lambda Config
# ==========================================================================

resource "aws_ssm_parameter" "environment_schedules" {
  for_each = var.environment_schedules

  name  = "/${var.prefix}/schedules/${var.aws_account_id_destination}/${each.key}"
  type  = "SecureString"
  value = jsonencode({
    environment = each.key
    schedule    = each.value
  })

  tags = merge(local.tags, {
    Environment = each.key
  })
}