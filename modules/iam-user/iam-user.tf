# ==========================================================================
#  Module IAM User: iam-user.tf
# --------------------------------------------------------------------------
#  Description:
#    IAM List Account
# --------------------------------------------------------------------------
#    - List Administrator Account
#    - List Developer Account
# ==========================================================================

# --------------------------------------------------------------------------
#  IAM User
# --------------------------------------------------------------------------

locals {
  iam_devopscorner_tags = {
    "Team" = "DCI"
  }

  dci_team_developer     = var.dci_team_developer
  dci_team_administrator = var.dci_team_administrator
  dci_team_billing       = var.dci_team_billing
}

# --------------------------------------------------------------------------
#  DCI Developer Team
# --------------------------------------------------------------------------
resource "aws_iam_user" "devopscorner_developer" {
  provider = aws.destination

  ## Group: Developer
  for_each = toset(
    local.dci_team_developer
  )

  name = each.key

  tags = merge(
    local.tags,
    local.iam_devopscorner_tags,
    {
      Name          = "${lower(each.key)}"
      ResourceGroup = "IAM-DCI"
      Services      = "IAM"
    }
  )
}

# --------------------------------------------------------------------------
#  DCI Administrator Team
# --------------------------------------------------------------------------
resource "aws_iam_user" "devopscorner_admin" {
  provider = aws.destination

  ## Group: Administrator
  for_each = toset(
    local.dci_team_administrator
  )

  name = each.key

  tags = merge(
    local.tags,
    local.iam_devopscorner_tags,
    {
      Name          = "${lower(each.key)}"
      ResourceGroup = "IAM-DCI"
      Services      = "IAM"
    }
  )
}

# --------------------------------------------------------------------------
#  DCI Billing Team
# --------------------------------------------------------------------------
resource "aws_iam_user" "devopscorner_billing" {
  provider = aws.destination

  ## Group: Billing
  for_each = toset(
    local.dci_team_billing
  )

  name = each.key

  tags = merge(
    local.tags,
    local.iam_devopscorner_tags,
    {
      Name          = "${lower(each.key)}"
      ResourceGroup = "IAM-DCI"
      Services      = "IAM"
    }
  )
}
