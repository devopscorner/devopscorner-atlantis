# ==========================================================================
#  888899990000 - IAM: output.tf
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
  value       = module.iam-user.dci_developer_group_name
}

output "dci_developer_group_arn" {
  description = "Developer Group ARN"
  value       = module.iam-user.dci_developer_group_arn
}

output "dci_admin_group_name" {
  description = "Administrator Group Name"
  value       = module.iam-user.dci_admin_group_name
}

output "dci_admin_group_arn" {
  description = "Administrator Group ARN"
  value       = module.iam-user.dci_admin_group_arn
}

output "dci_billing_group_name" {
  description = "Billing Group Name"
  value       = module.iam-user.dci_billing_group_name
}

output "dci_billing_group_arn" {
  description = "Billing Group ARN"
  value       = module.iam-user.dci_billing_group_arn
}

# --------------------------------------------------------------------------
#  List Policy
# --------------------------------------------------------------------------
output "dci_developer_policy" {
  description = "DCI Developer Policy Name"
  value       = module.iam-user.dci_developer_policy
}

output "dci_developer_policy_arn" {
  description = "DCI Developer Policy ARN"
  value       = module.iam-user.dci_developer_policy_arn
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
output "summary" {
  description = "Summary IAM User Configuration"
  value       = module.iam-user.summary
}
