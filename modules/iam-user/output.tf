# ==========================================================================
#  Module IAM User: output.tf
# --------------------------------------------------------------------------
#  Description
#    Output Terraform Value
# --------------------------------------------------------------------------
#    - List Group
#    - List Policy
#    - List Role
#    - List User
# ==========================================================================

# --------------------------------------------------------------------------
#  List Group
# --------------------------------------------------------------------------
output "dci_developer_group_name" {
  description = "Developer Group Name"
  value       = aws_iam_group.dci_developer.name
}

output "dci_developer_group_arn" {
  description = "Developer Group ARN"
  value       = aws_iam_group.dci_developer.arn
}

output "dci_admin_group_name" {
  description = "Administrator Group Name"
  value       = aws_iam_group.dci_administrator.name
}

output "dci_admin_group_arn" {
  description = "Administrator Group ARN"
  value       = aws_iam_group.dci_administrator.arn
}

output "dci_billing_group_name" {
  description = "Billing Group Name"
  value       = aws_iam_group.dci_billing.name
}

output "dci_billing_group_arn" {
  description = "Billing Group ARN"
  value       = aws_iam_group.dci_billing.arn
}

# --------------------------------------------------------------------------
#  List Policy
# --------------------------------------------------------------------------
output "dci_developer_policy" {
  description = "DCI Developer Policy Name"
  value       = aws_iam_policy.dci_developer_policy.name
}

output "dci_developer_policy_arn" {
  description = "DCI Developer Policy ARN"
  value       = aws_iam_policy.dci_developer_policy.arn
}

# --------------------------------------------------------------------------
#  List User
# --------------------------------------------------------------------------
output "list_dci_developer" {
  description = "DCI Developer Account"
  value       = var.dci_team_developer
}

output "list_dci_administrator" {
  description = "DCI Administrator Account"
  value       = var.dci_team_administrator
}

output "list_dci_billing" {
  description = "DCI Billing Account"
  value       = var.dci_team_billing
}

# --------------------------------------------------------------------------
#  Summary
# --------------------------------------------------------------------------
locals {
  summary = <<SUMMARY
Developer:
  Group Name:        ${aws_iam_group.dci_developer.name}
  Group ARN:         ${aws_iam_group.dci_developer.arn}
  Policy Name:       ${aws_iam_policy.dci_developer_policy.name}
  Policy ARN:
    - ${aws_iam_policy.dci_developer_policy.arn}
    - ${local.ARN_Policy_AmazonDynamoDBFullAccess}
    - ${local.ARN_Policy_AWSLambda_FullAccess}
    - ${local.ARN_Policy_AmazonRedshiftFullAccess}
    - ${local.ARN_Policy_AmazonS3FullAccess}
    - ${aws_iam_policy.dci_poweruser_acess.arn}
Administrator:
  Group Name:        ${aws_iam_group.dci_administrator.name}
  Group ARN:         ${aws_iam_group.dci_administrator.arn}
  Policy ARN:
    - ${local.ARN_Policy_AdministratorAccess}
    - ${local.ARN_Policy_AWSOrganizationsFullAccess}
    - ${aws_iam_policy.dci_iamfull_acess.arn}
SUMMARY
}

output "summary" {
  description = "Summary IAM User Configuration"
  value       = local.summary
}
