# ==========================================================================
#  888899990000 - EKS: _eks_var.tf (Spesific Environment)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Input Variable for Environment Variables
# ==========================================================================

# --------------------------------------------------------------------------
#  AWS Zone
# --------------------------------------------------------------------------
variable "aws_az" {
  type        = map(string)
  description = "AWS Zone Target Deployment"
  default = {
    lab     = "ap-southeast-3a"
    nonprod = "ap-southeast-3a"
    nonprod = "ap-southeast-3a"
    prod    = "ap-southeast-3a"
  }
}

# --------------------------------------------------------------------------
#  Bucket Name
# --------------------------------------------------------------------------
variable "bucket_name" {
  type        = string
  description = "Bucket Name"
  default     = "dci-awscb"
}

# --------------------------------------------------------------------------
#  SSH public key
# --------------------------------------------------------------------------
variable "ssh_public_key" {
  type        = string
  description = "SSH Public Key"
  ## file:///Users/[username]/.ssh/id_rsa.pub
  default = ""
}

# --------------------------------------------------------------------------
#  VPN Id
# --------------------------------------------------------------------------
variable "vpn_infra" {
  type        = map(string)
  description = "VPN Infra"
  default = {
    lab     = "sg-1234567890"
    nonprod = "sg-1234567890"
    prod    = "sg-0987654321"
  }
}

# --------------------------------------------------------------------------
#  EC2 Instance
# --------------------------------------------------------------------------
variable "access_my_ip" {
  type        = string
  description = "Your IP Address"
  default     = "103.59.235.0/22"
}

# --------------------------------------------------------------------------
#  DNS (Public)
# --------------------------------------------------------------------------
variable "dns_zone" {
  type = map(string)
  default = {
    dev     = "Z0308838GET9N8B7EGSC"
    uat     = "Z0308838GET9N8B7EGSC"
    lab     = "Z0308838GET9N8B7EGSC"
    staging = "Z0308838GET9N8B7EGSC"
    nonprod = "Z0308838GET9N8B7EGSC"
    prod    = "Z0308838GET9N8B7EGSC"
  }
}

variable "dns_url" {
  type = map(string)
  default = {
    lab     = "devopscorner.id"
    staging = "devopscorner.id"
    nonprod = "devopscorner.id"
    prod    = "devopscorner.id"
  }
}

# --------------------------------------------------------------------------
#  EKS Cluster
# --------------------------------------------------------------------------
# PEM File from existing
variable "eks_cluster_name" {
  type        = string
  description = "default cluster name"
  default     = "dci-awscb"
}


# --------------------------------------------------------------------------
#  SSH configurations
# --------------------------------------------------------------------------
# PEM File from existing
variable "ssh_key_pair" {
  type        = map(string)
  description = "default keyname"
  default = {
    lab     = "dci-poc"
    staging = "dci-poc"
    nonprod = "dci-poc"
    prod    = "dci-poc"
  }
}

variable "eks_name_env" {
  type = map(string)
  default = {
    lab     = "lab"
    staging = "staging"
    nonprod = "nonprod"
    prod    = "prod"
  }
}

variable "k8s_version" {
  type = map(string)
  default = {
    lab     = "1.32"
    staging = "1.32"
    nonprod = "1.32"
    prod    = "1.32"
  }
}

variable "nginx_version" {
  type    = string
  default = "4.8.4"
}

variable "linkerd_version" {
  type    = string
  default = "2.11.2"
}

variable "namespace" {
  description = "create namespace"
  type = list(object({
    name        = string
    labels      = map(string)
    annotations = map(string)
  }))
  default = [
    {
      name = "linkerd"
      labels = {
        "app.kubernetes.io/managed-by"         = "Helm",
        "config.linkerd.io/admission-webhooks" = "disabled",
        "kubernetes.io/metadata.name"          = "linkerd",
        "linkerd.io/control-plane-ns"          = "linkerd",
        "linkerd.io/is-control-plane"          = "true",
      }
      annotations = {
        "linkerd.io/inject"              = "disabled",
        "meta.helm.sh/release-name"      = "linkerd",
        "meta.helm.sh/release-namespace" = "linkerd",

      }
    }
    # {
    #   name = "linkerd-multicluster"
    #   labels = {
    #     "app.kubernetes.io/managed-by" = "Helm"
    #     "kubernetes.io/metadata.name" = "linkerd-multicluster"
    #     "linkerd.io/extension"        = "multicluster"
    #   }
    #   annotations = {
    #     "meta.helm.sh/release-name"      = "linkerd-multicluster",
    #     "meta.helm.sh/release-namespace" = "linkerd-multicluster",

    #   }
    # }
  ]
}

variable "default_tags" {
  type = map(any)
  default = {
    staging = {
      Environment     = "STG"
      Name            = "EKS-1.32"
      Department      = "DEVOPS"
      DepartmentGroup = "STG-DEVOPS"
      ResourceGroup   = "STG-EKS"
    }
    nonprod = {
      Environment     = "UAT"
      Name            = "EKS-1.32"
      Department      = "DEVOPS"
      DepartmentGroup = "UAT-DEVOPS"
      ResourceGroup   = "UAT-EKS"
    }
    prod = {
      Environment     = "PROD"
      Name            = "EKS-1.32"
      Department      = "DEVOPS"
      DepartmentGroup = "PROD-DEVOPS"
      ResourceGroup   = "PROD-EKS"
    }
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
    lab     = "v1.3.7-eksbuild.2" # Latest compatible with EKS 1.32
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