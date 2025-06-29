# ==========================================================================
#  Module EKS: autoscale-node-devops.tf (EKS Autoscale Configuration)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Node VPC Subnet
#    - Node Scaling
#    - Node Tagging
# ==========================================================================

#============================================
# NODE GROUP - DCI APP & TOOLS
#============================================
locals {
  #for tagging
  Environment_app     = "RND"
  Name_app            = "EKS-1.32-DCI-APP"
  Type_app            = "PRODUCTS"
  ProductName_app     = "EKS-DCI"
  ProductGroup_app    = "APP-EKS-DCI"
  Department_app      = "DEVOPS"
  DepartmentGroup_app = "RND-DEVOPS"
  ResourceGroup_app   = "RND-EKS-DCI"
  Services_app        = "APP"
}

# --------------------------------------------------------------------------
#  Autoscaling Schedule Node
# --------------------------------------------------------------------------
# References:
# - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_schedule
# - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment

## Scale Down
resource "aws_autoscaling_schedule" "scale_down_devops_app" {
  provider               = aws.destination
  autoscaling_group_name = aws_eks_node_group.devops["app"].resources[0].autoscaling_groups[0].name
  desired_capacity       = 0
  max_size               = 1
  min_size               = 0
  recurrence             = "0 15,18 * * *"
  scheduled_action_name  = "scale_down"
}

## Scale Up
resource "aws_autoscaling_schedule" "scale_up_devops_app" {
  provider               = aws.destination
  autoscaling_group_name = aws_eks_node_group.devops["app"].resources[0].autoscaling_groups[0].name
  desired_capacity       = 1
  max_size               = 5
  min_size               = 1
  recurrence             = "0 0 * * MON-FRI"
  scheduled_action_name  = "scale_up"
}

# --------------------------------------------------------------------------
#  Autoscaling Tag
# --------------------------------------------------------------------------
# Monitoring
resource "aws_autoscaling_group_tag" "Environment_group_tag_devops_app" {
  provider = aws.destination

  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["app"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "Environment"
    value               = local.Environment_app
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Name_group_tag_devops_app" {
  provider = aws.destination

  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["app"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "Name"
    value               = local.Name_app
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Type_group_tag_devops_app" {
  provider = aws.destination

  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["app"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "Type"
    value               = local.Type_app
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ProductName_group_tag_devops_app" {
  provider = aws.destination

  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["app"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "ProductName"
    value               = local.ProductName_app
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ProductGroup_group_tag_devops_app" {
  provider = aws.destination

  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["app"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "ProductGroup"
    value               = local.ProductGroup_app
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Department_group_tag_devops_app" {
  provider = aws.destination

  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["app"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "Department"
    value               = local.Department_app
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "DepartmentGroup_group_tag_devops_app" {
  provider = aws.destination

  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["app"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "DepartmentGroup"
    value               = local.DepartmentGroup_app
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ResourceGroup_group_tag_devops_app" {
  provider = aws.destination

  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["app"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "ResourceGroup"
    value               = local.ResourceGroup_app
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Services_group_tag_devops_app" {
  provider = aws.destination

  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["app"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "Service"
    value               = local.Services_app
    propagate_at_launch = true
  }
}

// Mandatory TAGS for Cluster-Autoscaller
resource "aws_autoscaling_group_tag" "Clustername_group_tag_devops_app" {
  provider = aws.destination

  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["app"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "ClusterName"
    value               = "${var.eks_cluster_name}-${var.eks_name_env[local.env]}"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Autoscaler_ownership_group_tag_devops_app" {
  provider = aws.destination

  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["app"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "k8s.io/cluster-autoscaler/${var.eks_cluster_name}-${var.eks_name_env[local.env]}"
    value               = "owned"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Autoscaler_enable_group_tag_devops_app" {
  provider = aws.destination

  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["app"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    value               = "true"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Terraform_group_tag_devops_app" {
  provider = aws.destination

  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["app"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "Terraform"
    value               = "true"
    propagate_at_launch = true
  }
}

# --------------------------------------------------------------------------
#  Autoscaling Output
# --------------------------------------------------------------------------
## Scale Down ##
output "eks_node_scale_down_devops_app" {
  value = aws_autoscaling_schedule.scale_down_devops_app.arn
}

## Scale Up ##
output "eks_node_scale_up_devops_app" {
  value = aws_autoscaling_schedule.scale_up_devops_app.arn
}

# --------------------------------------------------------------------------
#  Autoscaling Node Group Output
# --------------------------------------------------------------------------
## Monitoring Output #
output "eks_node_asg_group_devops_app" {
  value = aws_eks_node_group.devops["app"].resources[0].autoscaling_groups[0].name
}
