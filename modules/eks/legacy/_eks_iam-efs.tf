##############################################################
### EFS CSI Driver ###
##############################################################
resource "aws_iam_policy" "efs_csi_driver_policy" {
  provider = aws.destination
  name     = "aws-efs-csi-driver-${var.eks_cluster_name}-${var.eks_name_env[local.env]}"
  policy   = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "elasticfilesystem:DescribeAccessPoints",
                "elasticfilesystem:DescribeFileSystems",
                "elasticfilesystem:DescribeMountTargets",
                "ec2:DescribeAvailabilityZones"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "elasticfilesystem:CreateAccessPoint"
            ],
            "Resource": "*",
            "Condition": {
                "StringLike": {
                    "aws:RequestTag/efs.csi.aws.com/cluster": "true"
                }
            }
        },
        {
            "Effect": "Allow",
            "Action": [
                "elasticfilesystem:TagResource"
            ],
            "Resource": "*",
            "Condition": {
                "StringLike": {
                    "aws:ResourceTag/efs.csi.aws.com/cluster": "true"
                }
            }
        },
        {
            "Effect": "Allow",
            "Action": "elasticfilesystem:DeleteAccessPoint",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "aws:ResourceTag/efs.csi.aws.com/cluster": "true"
                }
            }
        }
    ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "efs_csi_driver_policy" {
  provider   = aws.destination
  policy_arn = aws_iam_policy.efs_csi_driver_policy.arn
  role       = aws_iam_role.eks_nodes.name
}
