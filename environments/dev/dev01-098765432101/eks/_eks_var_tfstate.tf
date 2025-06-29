# ==========================================================================
#  098765432101 - EKS: variable.tf
# --------------------------------------------------------------------------
#  Description:
#    Global Variable
# --------------------------------------------------------------------------
#    - KMS Key ID
#    - KMS Key Environment
#    - AWS Region
#    - AWS Account ID
#    - AWS Account Profile
#    - Workspace ID
#    - Workspace Environment
#    - Global Tags
#    - Terraform State S3 Bucket Name
#    - Terraform State S3 Key (Prefix)
#    - Terraform State S3 DynamoDB Table
# ==========================================================================

# --------------------------------------------------------------------------
#  Bucket Terraform State
# --------------------------------------------------------------------------
variable "tfstate_bucket" {
  description = "Name of bucket to store tfstate"
  type        = string
  default     = "tf-state-098765432101-ap-southeast-3"
}

variable "tfstate_dynamodb_table" {
  description = "Name of dynamodb table to store tfstate"
  type        = string
  default     = "ddb-tf-state-098765432101-ap-southeast-3"
}

variable "tfstate_path" {
  description = "Path .tfstate in Bucket"
  type        = string
  default     = "tfstate/tfstate"
}

variable "tfstate_encrypt" {
  description = "Name of bucket to store tfstate"
  type        = bool
  default     = true
}
