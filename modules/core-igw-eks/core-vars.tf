# ==========================================================================
#  Module Core: core-vars.tf
# --------------------------------------------------------------------------
#  Description
#    Core Infrastructure Spesific Variable
# --------------------------------------------------------------------------
#    - Core Prefix Name
#    - Core VPC CIDR Block
#    - Core VPC Peer
#    - Core VPC Peer Owner ID
#    - Core VPC Gateway Propagating
#    - Core VPC CIDR Secondary Zone A
#    - Core VPC CIDR Secondary Zone B
#    - Core Prefix EKS
# ==========================================================================

# --------------------------------------------------------------------------
#  Prefix Infra
# --------------------------------------------------------------------------
variable "coreinfra" {
  description = "Core Infrastrucre Name Prefix"
  type        = string
}

# --------------------------------------------------------------------------
#  VPC
# --------------------------------------------------------------------------
variable "vpc_cidr" {
  description = "Core Infrastrucre CIDR Block"
  type        = map(string)
}

variable "vpc_peer" {
  description = "Core Infrastrucre VPC Peers ID"
  type        = map(string)
}

variable "peer_owner_id" {
  description = "Core Infrastrucre VPC Peers Owner ID"
  type        = map(string)
}

variable "propagating_vgws" {
  description = "Core Infrastrucre VPC Gateway Propagating"
  type        = map(string)
}

# variable "vpc_cidr_secondary_a" {
#   description = "Core Infrastrucre VPC CIDR Secondary Zone A"
#   type = map(string)
# }

# variable "vpc_cidr_secondary_b" {
#   description = "Core Infrastrucre VPC CIDR Secondary Zone B"
#   type = map(string)
# }

# --------------------------------------------------------------------------
#  Infra Prefix
# --------------------------------------------------------------------------
# EKS Prefix
variable "eks_prefix" {
  description = "EKS Prefix Name"
  type        = string
}

# --------------------------------------------------------------------------
#  Subnet
# --------------------------------------------------------------------------
## EKS Private
variable "eks_private_a" {
  description = "Private Subnet for EKS Zone A"
  type        = map(string)
}

variable "eks_private_b" {
  description = "Private Subnet for EKS Zone B"
  type        = map(string)
}

variable "eks_private_c" {
  description = "Private Subnet for EKS Zone C"
  type        = map(string)
}

## EKS Public
variable "eks_public_a" {
  description = "Public Subnet for EKS Zone A"
  type        = map(string)
}

variable "eks_public_b" {
  description = "Public Subnet for EKS Zone B"
  type        = map(string)
}

variable "eks_public_c" {
  description = "Public Subnet for EKS Zone C"
  type        = map(string)
}

# --------------------------------------------------------------------------
#  Routing Table
# --------------------------------------------------------------------------
# EKS RT Prefix
variable "eks_rt_prefix" {
  description = "IGW EKS Routing Table Prefix Name"
  type        = string
}

# --------------------------------------------------------------------------
#  Internet Gateway
# --------------------------------------------------------------------------
# IGW Prefix
variable "igw_prefix" {
  description = "IGW Prefix Name"
  type        = string
}

# IGW RT Prefix
variable "igw_rt_prefix" {
  description = "IGW Routing Table Prefix Name"
  type        = string
}
