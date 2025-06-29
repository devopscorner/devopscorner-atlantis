# ==========================================================================
#  112233445566 - EKS: main.tf
# --------------------------------------------------------------------------
#  Description:
#    Main Terraform Module
# --------------------------------------------------------------------------
#    - Workspace Environment
#    - Common Tags
#    - Module Core
# ==========================================================================

# --------------------------------------------------------------------------
#  Workspace Environmet
# --------------------------------------------------------------------------
locals {
  env = terraform.workspace
}

# --------------------------------------------------------------------------
#  Global Tags
# --------------------------------------------------------------------------
locals {
  tags = {
    Environment     = "${var.environment[local.env]}"
    Department      = "${var.department}"
    DepartmentGroup = "${var.environment[local.env]}-${var.department}"
    Terraform       = true
  }
}

# --------------------------------------------------------------------------
#  Reuse Module: Core
# --------------------------------------------------------------------------
module "core" {
  source = "../../../../modules//core-nat-eks"

  aws_region                      = var.aws_region
  aws_account_id_source           = var.aws_account_id_source
  aws_account_id_destination      = var.aws_account_id_destination
  aws_account_profile_source      = var.aws_account_profile_source
  aws_account_profile_destination = var.aws_account_profile_destination
  aws_access_key                  = var.aws_access_key
  aws_secret_key                  = var.aws_secret_key
  workspace_name                  = var.workspace_name
  workspace_env                   = var.workspace_env
  environment                     = var.environment
  department                      = var.department
  kms_key                         = var.kms_key
  kms_env                         = var.kms_env

  coreinfra = var.coreinfra
  vpc_cidr = {
    default = "${data.terraform_remote_state.core_state.outputs.vpc_cidr}"
    lab     = "${data.terraform_remote_state.core_state.outputs.vpc_cidr}"
    staging = "${data.terraform_remote_state.core_state.outputs.vpc_cidr}"
    nonprod = "${data.terraform_remote_state.core_state.outputs.vpc_cidr}"
    prod    = "${data.terraform_remote_state.core_state.outputs.vpc_cidr}"
  }
  vpc_peer         = var.vpc_peer
  peer_owner_id    = var.peer_owner_id
  propagating_vgws = var.propagating_vgws
  eks_prefix       = var.eks_prefix
  nat_eks_prefix   = var.nat_eks_prefix

  eks_private_a = {
    default = "${data.terraform_remote_state.core_state.outputs.eks_private_1a_cidr}"
    lab     = "${data.terraform_remote_state.core_state.outputs.eks_private_1a_cidr}"
    staging = "${data.terraform_remote_state.core_state.outputs.eks_private_1a_cidr}"
    nonprod = "${data.terraform_remote_state.core_state.outputs.eks_private_1a_cidr}"
    prod    = "${data.terraform_remote_state.core_state.outputs.eks_private_1a_cidr}"
  }
  eks_private_b = {
    default = "${data.terraform_remote_state.core_state.outputs.eks_private_1b_cidr}"
    lab     = "${data.terraform_remote_state.core_state.outputs.eks_private_1b_cidr}"
    staging = "${data.terraform_remote_state.core_state.outputs.eks_private_1b_cidr}"
    nonprod = "${data.terraform_remote_state.core_state.outputs.eks_private_1b_cidr}"
    prod    = "${data.terraform_remote_state.core_state.outputs.eks_private_1b_cidr}"
  }
  eks_private_c = {
    default = "${data.terraform_remote_state.core_state.outputs.eks_private_1c_cidr}"
    lab     = "${data.terraform_remote_state.core_state.outputs.eks_private_1c_cidr}"
    staging = "${data.terraform_remote_state.core_state.outputs.eks_private_1c_cidr}"
    nonprod = "${data.terraform_remote_state.core_state.outputs.eks_private_1c_cidr}"
    prod    = "${data.terraform_remote_state.core_state.outputs.eks_private_1c_cidr}"
  }
  eks_public_a = {
    default = "${data.terraform_remote_state.core_state.outputs.eks_public_1a_cidr}"
    lab     = "${data.terraform_remote_state.core_state.outputs.eks_public_1a_cidr}"
    staging = "${data.terraform_remote_state.core_state.outputs.eks_public_1a_cidr}"
    nonprod = "${data.terraform_remote_state.core_state.outputs.eks_public_1a_cidr}"
    prod    = "${data.terraform_remote_state.core_state.outputs.eks_public_1a_cidr}"
  }
  eks_public_b  = {
    default = "${data.terraform_remote_state.core_state.outputs.eks_public_1b_cidr}"
    lab     = "${data.terraform_remote_state.core_state.outputs.eks_public_1b_cidr}"
    staging = "${data.terraform_remote_state.core_state.outputs.eks_public_1b_cidr}"
    nonprod = "${data.terraform_remote_state.core_state.outputs.eks_public_1b_cidr}"
    prod    = "${data.terraform_remote_state.core_state.outputs.eks_public_1b_cidr}"
  }
  eks_public_c = {
    default = "${data.terraform_remote_state.core_state.outputs.eks_public_1c_cidr}"
    lab     = "${data.terraform_remote_state.core_state.outputs.eks_public_1c_cidr}"
    staging = "${data.terraform_remote_state.core_state.outputs.eks_public_1c_cidr}"
    nonprod = "${data.terraform_remote_state.core_state.outputs.eks_public_1c_cidr}"
    prod    = "${data.terraform_remote_state.core_state.outputs.eks_public_1c_cidr}"
  }
  eks_rt_prefix = var.eks_rt_prefix
  igw_prefix    = var.igw_prefix
  igw_rt_prefix = var.igw_rt_prefix
  nat_prefix    = var.nat_prefix
  nat_rt_prefix = var.nat_rt_prefix
}

# --------------------------------------------------------------------------
#  Reuse Module: EKS
# --------------------------------------------------------------------------
module "eks" {
  source = "../../../../modules//eks"

  aws_region                      = var.aws_region
  aws_account_id_source           = var.aws_account_id_source
  aws_account_id_destination      = var.aws_account_id_destination
  aws_account_profile_source      = var.aws_account_profile_source
  aws_account_profile_destination = var.aws_account_profile_destination
  aws_access_key                  = var.aws_access_key
  aws_secret_key                  = var.aws_secret_key
  workspace_name                  = var.workspace_name
  workspace_env                   = var.workspace_env
  environment                     = var.environment
  department                      = var.department
  kms_key                         = var.kms_key
  kms_env                         = var.kms_env

  aws_az           = var.aws_az
  bucket_name      = var.bucket_name
  ssh_public_key   = var.ssh_public_key
  vpn_infra        = var.vpn_infra
  access_my_ip     = var.access_my_ip
  dns_zone         = var.dns_zone
  dns_url          = var.dns_url
  eks_cluster_name = var.eks_cluster_name
  ssh_key_pair     = var.ssh_key_pair
  eks_name_env     = var.eks_name_env
  k8s_version      = var.k8s_version
}
