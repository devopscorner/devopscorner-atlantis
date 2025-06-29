# ==========================================================================
#  Module IAM User: iam-role.tf
# --------------------------------------------------------------------------
#  Description:
#    IAM User Role
# --------------------------------------------------------------------------
#    - Role Name
#    - Assume Role
#    - Inline Policy
# ==========================================================================

locals {
  TrustedEntities = {
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : [
            "arn:aws:iam::${var.aws_account_id_destination}:user/TF-User-Executor-${var.aws_account_id_destination}"
          ]
        },
        "Action" : "sts:AssumeRole",
        "Condition" : {}
      }
    ]
  }

  IAMFullAccess = {
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "iam:*",
          "organizations:DescribeAccount",
          "organizations:DescribeOrganization",
          "organizations:DescribeOrganizationalUnit",
          "organizations:DescribePolicy",
          "organizations:ListChildren",
          "organizations:ListParents",
          "organizations:ListPoliciesForTarget",
          "organizations:ListRoots",
          "organizations:ListPolicies",
          "organizations:ListTargetsForPolicy"
        ],
        "Resource" : "*"
      }
    ]
  }

  PowerUserAccess = {
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "NotAction" : [
          "iam:*",
          "organizations:*",
          "account:*"
        ],
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "account:GetAccountInformation",
          "account:GetPrimaryEmail",
          "account:ListRegions",
          "iam:CreateServiceLinkedRole",
          "iam:DeleteServiceLinkedRole",
          "iam:ListRoles",
          "organizations:DescribeOrganization"
        ],
        "Resource" : "*"
      }
    ]
  }
}
