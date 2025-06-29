# ==========================================================================
#  Module EC2 Scheduler-Config: scheduler-config.tf
# --------------------------------------------------------------------------
#  Description:
#    Variables for the EC2 Scheduler Configuration Module
# --------------------------------------------------------------------------
#    - Prefix for Resource Names
#    - Environment Schedules
# ==========================================================================

variable "prefix" {
  description = "Resource name prefix"
  type        = string
  default     = "ec2-scheduler"
}

variable "environment_schedules" {
  description = "Schedule configurations for different environments"
  type = map(object({
    start_time = string
    stop_time  = string
    time_zone  = string
    work_days  = list(string)
    exceptions = list(string)
    instance_tags = map(string)
  }))
}