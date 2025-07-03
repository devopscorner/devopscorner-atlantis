# ==========================================================================
#  Module EKS: output-addons.tf (Output Terraform)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Return value eks module addons
# ==========================================================================

# --------------------------------------------------------------------------
#  Pod Identity Agent Addon
# --------------------------------------------------------------------------
output "pod_identity_agent_addon_arn" {
  description = "ARN of the Pod Identity Agent addon"
  value       = aws_eks_addon.pod_identity_agent.arn
}

# --------------------------------------------------------------------------
#  EBS CSI Driver Pod Identity Outputs
# --------------------------------------------------------------------------
output "ebs_csi_driver_role_arn" {
  description = "ARN of the EBS CSI driver IAM role"
  value       = aws_iam_role.ebs_csi_pod_identity_role.arn
}

output "ebs_csi_driver_policy_arn" {
  description = "ARN of the EBS CSI driver IAM policy"
  value       = aws_iam_policy.ebs_csi_driver_policy.arn
}

output "ebs_csi_pod_identity_association_arn" {
  description = "ARN of the EBS CSI driver pod identity association"
  value       = aws_eks_pod_identity_association.ebs_csi_driver.association_arn
}

output "ebs_csi_addon_arn" {
  description = "ARN of the EBS CSI driver addon"
  value       = aws_eks_addon.ebs_csi_driver.arn
}

# --------------------------------------------------------------------------
#  EFS CSI Driver Pod Identity Outputs
# --------------------------------------------------------------------------
output "efs_csi_driver_role_arn" {
  description = "ARN of the EFS CSI driver IAM role"
  value       = aws_iam_role.efs_csi_pod_identity_role.arn
}

output "efs_csi_driver_policy_arn" {
  description = "ARN of the EFS CSI driver IAM policy"
  value       = aws_iam_policy.efs_csi_driver_policy.arn
}

output "efs_csi_pod_identity_association_arn" {
  description = "ARN of the EFS CSI driver pod identity association"
  value       = aws_eks_pod_identity_association.efs_csi_driver.association_arn
}

output "efs_csi_addon_arn" {
  description = "ARN of the EFS CSI driver addon"
  value       = aws_eks_addon.efs_csi_driver.arn
}

# --------------------------------------------------------------------------
#  Additional EKS Addons Outputs
# --------------------------------------------------------------------------
# (-- not available for EKS 1.32 except manual --)
# ==========================================================================
# output "metrics_server_addon_arn" {
#   description = "ARN of the Metrics Server addon"
#   value       = aws_eks_addon.metrics_server.arn
# }

# output "cert_manager_addon_arn" {
#   description = "ARN of the Cert Manager addon"
#   value       = aws_eks_addon.cert_manager.arn
# }

# output "kube_state_metrics_addon_arn" {
#   description = "ARN of the Kube State Metrics addon"
#   value       = aws_eks_addon.kube_state_metrics.arn
# }
# ==========================================================================

output "kube_proxy_addon_arn" {
  description = "ARN of the Kube Proxy addon"
  value       = aws_eks_addon.kube_proxy.arn
}

output "vpc_cni_addon_arn" {
  description = "ARN of the Amazon VPC CNI addon"
  value       = aws_eks_addon.vpc_cni.arn
}

output "coredns_addon_arn" {
  description = "ARN of the CoreDNS addon"
  value       = aws_eks_addon.coredns.arn
}