# ==========================================================================
#  Module EKS: _eks_var.tf (Spesific Environment)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Input Variable for Environment Variables
# ==========================================================================

# --------------------------------------------------------------------------
#  AWS Zone
# --------------------------------------------------------------------------
variable "aws_az" {
  description = "AWS Zone Target Deployment"
  type        = map(string)
}

# --------------------------------------------------------------------------
#  Bucket Name
# --------------------------------------------------------------------------
variable "bucket_name" {
  description = "Bucket Name"
  type        = string
}

# --------------------------------------------------------------------------
#  SSH public key
# --------------------------------------------------------------------------
variable "ssh_public_key" {
  description = "SSH Public Key"
  type        = string
  ## file:///Users/[username]/.ssh/id_rsa.pub
}

# --------------------------------------------------------------------------
#  VPN Id
# --------------------------------------------------------------------------
variable "vpn_infra" {
  description = "VPN Infra"
  type        = map(string)
}

# --------------------------------------------------------------------------
#  EC2 Instance
# --------------------------------------------------------------------------
variable "access_my_ip" {
  description = "Your IP Address"
  type        = string
}

# --------------------------------------------------------------------------
#  DNS (Public)
# --------------------------------------------------------------------------
variable "dns_zone" {
  description = "DNS Zone EKS"
  type = map(string)
}

variable "dns_url" {
  description = "DNS URL EKS"
  type = map(string)
}

# --------------------------------------------------------------------------
#  EKS Cluster
# --------------------------------------------------------------------------
# PEM File from existing
variable "eks_cluster_name" {
  description = "Default cluster name"
  type        = string
}

# --------------------------------------------------------------------------
#  SSH configurations
# --------------------------------------------------------------------------
# PEM File from existing
variable "ssh_key_pair" {
  description = "Default keyname"
  type        = map(string)
}

variable "eks_name_env" {
  description = "Default EKS environment name"
  type = map(string)
  default = {
    lab     = "lab"
    staging = "staging"
    prod    = "prod"
  }
}

variable "k8s_version" {
  description = "Default EKS version"
  type = map(string)
  default = {
    lab     = "1.32"
    staging = "1.32"
    prod    = "1.32"
  }
}

# --------------------------------------------------------------------------
#  Pod Identity Agent Addon Version
# --------------------------------------------------------------------------
# aws eks describe-addon-versions \                                                                                                                                                                                                                                                                             ─╯
#   --addon-name eks-pod-identity-agent \
#   --kubernetes-version 1.32 \
#   --query 'addons[0].addonVersions[*].addonVersion' \
#   --output table
variable "pod_identity_agent_version" {
  description = "Pod Identity Agent addon version per environment"
  type        = map(string)
  default = {
    lab     = "v1.3.7-eksbuild.2"    # Latest compatible with EKS 1.32
    staging = "v1.3.7-eksbuild.2"
    prod    = "v1.3.7-eksbuild.2"
  }
}

# --------------------------------------------------------------------------
#  EBS CSI Driver Version
# --------------------------------------------------------------------------
variable "ebs_csi_driver_version" {
  description = "EBS CSI driver version per environment"
  type        = map(string)
  default = {
    lab     = "v1.45.0-eksbuild.2"
    staging = "v1.45.0-eksbuild.2"
    prod    = "v1.45.0-eksbuild.2"
  }
}

# --------------------------------------------------------------------------
#  EFS CSI Driver Version
# --------------------------------------------------------------------------
variable "efs_csi_driver_version" {
  description = "EFS CSI driver version per environment"
  type        = map(string)
  default = {
    lab     = "v2.1.8-eksbuild.1"
    staging = "v2.1.8-eksbuild.1"
    prod    = "v2.1.8-eksbuild.1"
  }
}

# --------------------------------------------------------------------------
#  Metrics Server Version
# --------------------------------------------------------------------------
variable "metrics_server_version" {
  description = "Metrics Server addon version per environment"
  type        = map(string)
  default = {
    lab     = "v0.7.2-eksbuild.4"
    staging = "v0.7.2-eksbuild.4"
    prod    = "v0.7.2-eksbuild.4"
  }
}

# --------------------------------------------------------------------------
#  Cert Manager Version
# --------------------------------------------------------------------------
variable "cert_manager_version" {
  description = "Cert Manager addon version per environment"
  type        = map(string)
  default = {
    lab     = "v1.18.1-eksbuild.1"
    staging = "v1.18.1-eksbuild.1"
    prod    = "v1.18.1-eksbuild.1"
  }
}

# --------------------------------------------------------------------------
#  Kube State Metrics Version
# --------------------------------------------------------------------------
variable "kube_state_metrics_version" {
  description = "Kube State Metrics addon version per environment"
  type        = map(string)
  default = {
    lab     = "v2.15.0-eksbuild.5"
    staging = "v2.15.0-eksbuild.5"
    prod    = "v2.15.0-eksbuild.5"
  }
}

# --------------------------------------------------------------------------
#  Kube Proxy Version
# --------------------------------------------------------------------------
variable "kube_proxy_version" {
  description = "Kube Proxy addon version per environment"
  type        = map(string)
  default = {
    lab     = "v1.32.5-eksbuild.2"
    staging = "v1.32.5-eksbuild.2"
    prod    = "v1.32.5-eksbuild.2"
  }
}

# --------------------------------------------------------------------------
#  Amazon VPC CNI Version
# --------------------------------------------------------------------------
variable "vpc_cni_version" {
  description = "Amazon VPC CNI addon version per environment"
  type        = map(string)
  default = {
    lab     = "v1.19.6-eksbuild.1"
    staging = "v1.19.6-eksbuild.1"
    prod    = "v1.19.6-eksbuild.1"
  }
}

# --------------------------------------------------------------------------
#  CoreDNS Version
# --------------------------------------------------------------------------
variable "coredns_version" {
  description = "CoreDNS addon version per environment"
  type        = map(string)
  default = {
    lab     = "v1.11.4-eksbuild.14"
    staging = "v1.11.4-eksbuild.14"
    prod    = "v1.11.4-eksbuild.14"
  }
}

# --------------------------------------------------------------------------
#  Snapshot Controller Version
# --------------------------------------------------------------------------
variable "snapshot_controller_version" {
  description = "Snapshot Controller addon version per environment"
  type        = map(string)
  default = {
    lab     = "v8.2.0-eksbuild.1"
    staging = "v8.2.0-eksbuild.1"
    prod    = "v8.2.0-eksbuild.1"
  }
}