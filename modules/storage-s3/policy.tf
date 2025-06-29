# modules/storage/policy.tf
# --------------------------------------------------------------------------
# Bucket Policy
# --------------------------------------------------------------------------
resource "aws_s3_bucket_policy" "main" {
  bucket = aws_s3_bucket.main.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "EnforceSSLOnly"
        Effect    = "Deny"
        Principal = {
          AWS = "*"
        }
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.main.arn,
          "${aws_s3_bucket.main.arn}/*"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      },
      {
        Sid    = "AllowIAMUserAccess"
        Effect = "Allow"
        Principal = {
          AWS = [
            "arn:aws:iam::${var.aws_account_id_destination}:root"
          ]
        }
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket",
          "s3:DeleteObject"
        ]
        Resource = [
          aws_s3_bucket.main.arn,
          "${aws_s3_bucket.main.arn}/*"
        ]
        Condition = {
          StringLike = {
            "aws:PrincipalArn": [
              "arn:aws:iam::${var.aws_account_id_destination}:user/*",
              "arn:aws:iam::${var.aws_account_id_destination}:role/*"
            ]
          }
        }
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.main]
}

# --------------------------------------------------------------------------
# Additional IAM policy for the groups
# --------------------------------------------------------------------------
resource "aws_iam_group_policy" "developer_s3_access" {
  name  = "s3-bucket-access-developer"
  group = var.group_awscloud_developer

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket",
          "s3:DeleteObject"
        ]
        Resource = [
          aws_s3_bucket.main.arn,
          "${aws_s3_bucket.main.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_group_policy" "administrator_s3_access" {
  name  = "s3-bucket-access-administrator"
  group = var.group_awscloud_administrator

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:*"
        ]
        Resource = [
          aws_s3_bucket.main.arn,
          "${aws_s3_bucket.main.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_group_policy" "billing_s3_access" {
  name  = "s3-bucket-access-billing"
  group = var.group_awscloud_billing

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.main.arn,
          "${aws_s3_bucket.main.arn}/*"
        ]
      }
    ]
  })
}