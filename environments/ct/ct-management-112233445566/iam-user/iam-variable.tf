# ==========================================================================
#  112233445566 - IAM: iam-variable.tf
# --------------------------------------------------------------------------
#  Description:
#    IAM Variable
# --------------------------------------------------------------------------
#    - Group Developer
#    - Group Administrator
#    - Policy Developer
#    - Policy Administrator
#    - Role Developer
#    - Role Administrator
# ==========================================================================

# --------------------------------------------------------------------------
#  Group Name
# --------------------------------------------------------------------------
variable "group_dci_developer" {
  description = "Developer Group Name"
  type        = string
  default     = "dci-developer"
}

variable "group_dci_administrator" {
  description = "Administrator Group Name"
  type        = string
  default     = "dci-administrator"
}

variable "group_dci_billing" {
  description = "Billing Group Name"
  type        = string
  default     = "dci-billing"
}

# --------------------------------------------------------------------------
#  Policy Name
# --------------------------------------------------------------------------
variable "policy_dci_developer" {
  description = "Developer Policy Name"
  type        = string
  default     = "dci-developer-policy"
}

variable "policy_dci_administrator" {
  description = "Administrator Policy Name"
  type        = string
  default     = "dci-administrator-policy"
}

variable "policy_dci_billing" {
  description = "Billing Policy Name"
  type        = string
  default     = "dci-billing-policy"
}

# --------------------------------------------------------------------------
#  TF-User Account
# --------------------------------------------------------------------------
variable "tf_user_executor" {
  description = "TF User Executor"
  type        = string
  default     = "TF-User-Executor-112233445566"
}

# --------------------------------------------------------------------------
#  User Team
# --------------------------------------------------------------------------
variable "dci_team_developer" {
  description = "DCI Developer Team Member"
  type        = list(any)
  default = [
    "developer.01@devopscorner.id",
    "developer.02@devopscorner.id"
  ]
}

variable "dci_team_administrator" {
  description = "DCI Administrator Team Member"
  type        = list(any)
  default = [
    "administrator.01@devopscorner.id",
    "administrator.02@devopscorner.id"
  ]
}

variable "dci_team_billing" {
  description = "DCI Billing Team Member"
  type        = list(any)
  default = [
    "billing.01@devopscorner.id",
    "billing.02@devopscorner.id"
  ]
}