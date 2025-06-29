# ==========================================================================
#  Module EC2 Scheduler-Core: scheduler-core.tf
# --------------------------------------------------------------------------
#  Description:
#    Variables for the EC2 Scheduler-Core module
# --------------------------------------------------------------------------
#    - Prefix
#    - Lambda Timeout
#    - Lambda Memory
# ==========================================================================

variable "prefix" {
  description = "Resource name prefix"
  type        = string
  default     = "ec2-scheduler"
}

variable "lambda_timeout" {
  description = "Lambda function timeout in seconds"
  type        = number
  default     = 300
}

variable "lambda_memory" {
  description = "Lambda function memory in MB"
  type        = number
  default     = 128
}
