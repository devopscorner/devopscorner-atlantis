# ==========================================================================
#  Module EKS: _eks_addons.tf (EKS Addons Configuration)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Metrics Server Addon
#    - Cert Manager Addon
#    - Kube State Metrics Addon
#    - Kube Proxy Addon
#    - Amazon VPC CNI Addon
#    - CoreDNS Addon
# ==========================================================================

# --------------------------------------------------------------------------
#  Metrics Server Addon (-- not available for EKS 1.32 except manual)
# --------------------------------------------------------------------------
# resource "aws_eks_addon" "metrics_server" {
#   provider      = aws.destination
#   cluster_name  = aws_eks_cluster.aws_eks.name
#   addon_name    = "eks-metrics-server"
#   addon_version = var.metrics_server_version[local.env]

#   resolve_conflicts_on_create = "OVERWRITE"
#   resolve_conflicts_on_update = "OVERWRITE"

#   tags = merge(
#     local.tags,
#     local.resources_tags,
#     {
#       Environment     = "${upper(var.environment[local.env])}"
#       Name            = "EKS-METRICS-SERVER-${upper(var.environment[local.env])}"
#       Type            = "EKS-ADDON"
#       ProductName     = "EKS-METRICS-SERVER"
#       ProductGroup    = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-EKS-ADDON" : "STG-EKS-ADDON"
#       Department      = "DEVOPS"
#       DepartmentGroup = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-DEVOPS" : "STG-DEVOPS"
#       ResourceGroup   = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-EKS-ADDON" : "STG-EKS-ADDON"
#       Services        = "METRICS-SERVER"
#     }
#   )

#   depends_on = [
#     aws_eks_cluster.aws_eks,
#     aws_eks_node_group.devops
#   ]
# }

# --------------------------------------------------------------------------
#  Cert Manager Addon (-- not available for EKS 1.32 except manual)
# --------------------------------------------------------------------------
# resource "aws_eks_addon" "cert_manager" {
#   provider      = aws.destination
#   cluster_name  = aws_eks_cluster.aws_eks.name
#   addon_name    = "aws-cert-manager"
#   addon_version = var.cert_manager_version[local.env]

#   resolve_conflicts_on_create = "OVERWRITE"
#   resolve_conflicts_on_update = "OVERWRITE"

#   tags = merge(
#     local.tags,
#     local.resources_tags,
#     {
#       Environment     = "${upper(var.environment[local.env])}"
#       Name            = "EKS-CERT-MANAGER-${upper(var.environment[local.env])}"
#       Type            = "EKS-ADDON"
#       ProductName     = "EKS-CERT-MANAGER"
#       ProductGroup    = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-EKS-ADDON" : "STG-EKS-ADDON"
#       Department      = "DEVOPS"
#       DepartmentGroup = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-DEVOPS" : "STG-DEVOPS"
#       ResourceGroup   = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-EKS-ADDON" : "STG-EKS-ADDON"
#       Services        = "CERT-MANAGER"
#     }
#   )

#   depends_on = [
#     aws_eks_cluster.aws_eks,
#     aws_eks_node_group.devops
#   ]
# }

# --------------------------------------------------------------------------
#  Kube State Metrics Addon (-- not available for EKS 1.32 except manual)
# --------------------------------------------------------------------------
# resource "aws_eks_addon" "kube_state_metrics" {
#   provider      = aws.destination
#   cluster_name  = aws_eks_cluster.aws_eks.name
#   addon_name    = "kube-state-metrics"
#   addon_version = var.kube_state_metrics_version[local.env]

#   resolve_conflicts_on_create = "OVERWRITE"
#   resolve_conflicts_on_update = "OVERWRITE"

#   tags = merge(
#     local.tags,
#     local.resources_tags,
#     {
#       Environment     = "${upper(var.environment[local.env])}"
#       Name            = "EKS-KUBE-STATE-METRICS-${upper(var.environment[local.env])}"
#       Type            = "EKS-ADDON"
#       ProductName     = "EKS-KUBE-STATE-METRICS"
#       ProductGroup    = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-EKS-ADDON" : "STG-EKS-ADDON"
#       Department      = "DEVOPS"
#       DepartmentGroup = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-DEVOPS" : "STG-DEVOPS"
#       ResourceGroup   = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-EKS-ADDON" : "STG-EKS-ADDON"
#       Services        = "KUBE-STATE-METRICS"
#     }
#   )

#   depends_on = [
#     aws_eks_cluster.aws_eks,
#     aws_eks_node_group.devops
#   ]
# }

# --------------------------------------------------------------------------
#  Kube Proxy Addon
# --------------------------------------------------------------------------
resource "aws_eks_addon" "kube_proxy" {
  provider      = aws.destination
  cluster_name  = aws_eks_cluster.aws_eks.name
  addon_name    = "kube-proxy"
  addon_version = var.kube_proxy_version[local.env]

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  tags = merge(
    local.tags,
    local.resources_tags,
    {
      Environment     = "${upper(var.environment[local.env])}"
      Name            = "EKS-KUBE-PROXY-${upper(var.environment[local.env])}"
      Type            = "EKS-ADDON"
      ProductName     = "EKS-KUBE-PROXY"
      ProductGroup    = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-EKS-ADDON" : "STG-EKS-ADDON"
      Department      = "DEVOPS"
      DepartmentGroup = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-DEVOPS" : "STG-DEVOPS"
      ResourceGroup   = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-EKS-ADDON" : "STG-EKS-ADDON"
      Services        = "KUBE-PROXY"
    }
  )

  depends_on = [
    aws_eks_cluster.aws_eks,
    aws_eks_node_group.devops
  ]
}

# --------------------------------------------------------------------------
#  Amazon VPC CNI Addon
# --------------------------------------------------------------------------
resource "aws_eks_addon" "vpc_cni" {
  provider      = aws.destination
  cluster_name  = aws_eks_cluster.aws_eks.name
  addon_name    = "vpc-cni"
  addon_version = var.vpc_cni_version[local.env]

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  tags = merge(
    local.tags,
    local.resources_tags,
    {
      Environment     = "${upper(var.environment[local.env])}"
      Name            = "EKS-VPC-CNI-${upper(var.environment[local.env])}"
      Type            = "EKS-ADDON"
      ProductName     = "EKS-VPC-CNI"
      ProductGroup    = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-EKS-ADDON" : "STG-EKS-ADDON"
      Department      = "DEVOPS"
      DepartmentGroup = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-DEVOPS" : "STG-DEVOPS"
      ResourceGroup   = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-EKS-ADDON" : "STG-EKS-ADDON"
      Services        = "VPC-CNI"
    }
  )

  depends_on = [
    aws_eks_cluster.aws_eks,
    aws_eks_node_group.devops
  ]
}

# --------------------------------------------------------------------------
#  CoreDNS Addon
# --------------------------------------------------------------------------
resource "aws_eks_addon" "coredns" {
  provider      = aws.destination
  cluster_name  = aws_eks_cluster.aws_eks.name
  addon_name    = "coredns"
  addon_version = var.coredns_version[local.env]

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  tags = merge(
    local.tags,
    local.resources_tags,
    {
      Environment     = "${upper(var.environment[local.env])}"
      Name            = "EKS-COREDNS-${upper(var.environment[local.env])}"
      Type            = "EKS-ADDON"
      ProductName     = "EKS-COREDNS"
      ProductGroup    = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-EKS-ADDON" : "STG-EKS-ADDON"
      Department      = "DEVOPS"
      DepartmentGroup = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-DEVOPS" : "STG-DEVOPS"
      ResourceGroup   = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-EKS-ADDON" : "STG-EKS-ADDON"
      Services        = "COREDNS"
    }
  )

  depends_on = [
    aws_eks_cluster.aws_eks,
    aws_eks_node_group.devops
  ]
}

# --------------------------------------------------------------------------
#  Snapshot Controller Addon
# --------------------------------------------------------------------------
resource "aws_eks_addon" "snapshot_controller" {
  provider      = aws.destination
  cluster_name  = aws_eks_cluster.aws_eks.name
  addon_name    = "snapshot-controller"
  addon_version = var.snapshot_controller_version[local.env]

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  tags = merge(
    local.tags,
    local.resources_tags,
    {
      Environment     = "${upper(var.environment[local.env])}"
      Name            = "EKS-SNAPSHOT-CONTROLLER-${upper(var.environment[local.env])}"
      Type            = "EKS-ADDON"
      ProductName     = "EKS-SNAPSHOT-CONTROLLER"
      ProductGroup    = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-EKS-ADDON" : "STG-EKS-ADDON"
      Department      = "DEVOPS"
      DepartmentGroup = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-DEVOPS" : "STG-DEVOPS"
      ResourceGroup   = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-EKS-ADDON" : "STG-EKS-ADDON"
      Services        = "SNAPSHOT-CONTROLLER"
    }
  )

  depends_on = [
    aws_eks_cluster.aws_eks,
    aws_eks_node_group.devops
  ]
}
