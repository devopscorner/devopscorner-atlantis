# Terraform Core Infrastructure for 098765432101

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.72 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_core"></a> [core](#module\_core) | ../../../../modules//core-nat-eks | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | The AWS Access Key | `string` | `""` | no |
| <a name="input_aws_account_id_destination"></a> [aws\_account\_id\_destination](#input\_aws\_account\_id\_destination) | The AWS Account ID to deploy the Budget in | `string` | `"098765432101"` | no |
| <a name="input_aws_account_id_source"></a> [aws\_account\_id\_source](#input\_aws\_account\_id\_source) | The AWS Account ID management | `string` | `"098765432101"` | no |
| <a name="input_aws_account_profile_destination"></a> [aws\_account\_profile\_destination](#input\_aws\_account\_profile\_destination) | The AWS Profile to deploy the Budget in | `string` | `"DCI-TF-User-Executor"` | no |
| <a name="input_aws_account_profile_source"></a> [aws\_account\_profile\_source](#input\_aws\_account\_profile\_source) | The AWS Profile management | `string` | `"DCI-TF-User-Executor"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to deploy the VPC certificate in | `string` | `"ap-southeast-3"` | no |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | The AWS Secret Key | `string` | `""` | no |
| <a name="input_coreinfra"></a> [coreinfra](#input\_coreinfra) | Core Infrastrucre Name Prefix | `string` | `"dci-tf-mgmt"` | no |
| <a name="input_department"></a> [department](#input\_department) | Department Owner | `string` | `"DEVOPS"` | no |
| <a name="input_eks_prefix"></a> [eks\_prefix](#input\_eks\_prefix) | EKS Prefix Name | `string` | `"eks"` | no |
| <a name="input_eks_private_a"></a> [eks\_private\_a](#input\_eks\_private\_a) | Private Subnet for EKS Zone A | `map(string)` | <pre>{<br/>  "default": "10.16.64.0/21",<br/>  "lab": "10.16.64.0/21",<br/>  "nonprod": "10.32.64.0/21",<br/>  "prod": "10.48.64.0/21",<br/>  "staging": "10.32.64.0/21"<br/>}</pre> | no |
| <a name="input_eks_private_b"></a> [eks\_private\_b](#input\_eks\_private\_b) | Private Subnet for EKS Zone B | `map(string)` | <pre>{<br/>  "default": "10.16.72.0/21",<br/>  "lab": "10.16.72.0/21",<br/>  "nonprod": "10.32.72.0/21",<br/>  "prod": "10.48.72.0/21",<br/>  "staging": "10.32.72.0/21"<br/>}</pre> | no |
| <a name="input_eks_private_c"></a> [eks\_private\_c](#input\_eks\_private\_c) | Private Subnet for EKS Zone C | `map(string)` | <pre>{<br/>  "default": "10.16.80.0/21",<br/>  "lab": "10.16.80.0/21",<br/>  "nonprod": "10.32.80.0/21",<br/>  "prod": "10.48.80.0/21",<br/>  "staging": "10.32.80.0/21"<br/>}</pre> | no |
| <a name="input_eks_public_a"></a> [eks\_public\_a](#input\_eks\_public\_a) | Public Subnet for EKS Zone A | `map(string)` | <pre>{<br/>  "default": "10.16.88.0/21",<br/>  "lab": "10.16.88.0/21",<br/>  "nonprod": "10.32.88.0/21",<br/>  "prod": "10.48.88.0/21",<br/>  "staging": "10.32.88.0/21"<br/>}</pre> | no |
| <a name="input_eks_public_b"></a> [eks\_public\_b](#input\_eks\_public\_b) | Public Subnet for EKS Zone B | `map(string)` | <pre>{<br/>  "default": "10.16.96.0/21",<br/>  "lab": "10.16.96.0/21",<br/>  "nonprod": "10.32.96.0/21",<br/>  "prod": "10.48.96.0/21",<br/>  "staging": "10.32.96.0/21"<br/>}</pre> | no |
| <a name="input_eks_public_c"></a> [eks\_public\_c](#input\_eks\_public\_c) | Public Subnet for EKS Zone C | `map(string)` | <pre>{<br/>  "default": "10.16.104.0/21",<br/>  "lab": "10.16.104.0/21",<br/>  "nonprod": "10.32.104.0/21",<br/>  "prod": "10.48.104.0/21",<br/>  "staging": "10.32.104.0/21"<br/>}</pre> | no |
| <a name="input_eks_rt_prefix"></a> [eks\_rt\_prefix](#input\_eks\_rt\_prefix) | NAT EKS Routing Table Prefix Name | `string` | `"eks-rt"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Target Environment (tags) | `map(string)` | <pre>{<br/>  "default": "DEF",<br/>  "lab": "RND",<br/>  "nonprod": "NONPROD",<br/>  "prod": "PROD",<br/>  "staging": "STG"<br/>}</pre> | no |
| <a name="input_igw_prefix"></a> [igw\_prefix](#input\_igw\_prefix) | IGW Prefix Name | `string` | `"igw"` | no |
| <a name="input_igw_rt_prefix"></a> [igw\_rt\_prefix](#input\_igw\_rt\_prefix) | IGW Routing Table Prefix Name | `string` | `"igw-rt"` | no |
| <a name="input_kms_env"></a> [kms\_env](#input\_kms\_env) | KMS Key Environment | `map(string)` | <pre>{<br/>  "lab": "RnD",<br/>  "nonprod": "NonProduction",<br/>  "prod": "Production",<br/>  "staging": "Staging"<br/>}</pre> | no |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | KMS Key References | `map(string)` | <pre>{<br/>  "default": "arn:aws:kms:ap-southeast-3:098765432101:key/HASH_KEY",<br/>  "lab": "arn:aws:kms:ap-southeast-3:098765432101:key/HASH_KEY",<br/>  "prod": "arn:aws:kms:ap-southeast-3:098765432101:key/HASH_KEY",<br/>  "staging": "arn:aws:kms:ap-southeast-3:098765432101:key/HASH_KEY"<br/>}</pre> | no |
| <a name="input_nat_eks_prefix"></a> [nat\_eks\_prefix](#input\_nat\_eks\_prefix) | NAT EKS Prefix Name | `string` | `"natgw_eks"` | no |
| <a name="input_nat_prefix"></a> [nat\_prefix](#input\_nat\_prefix) | NAT Prefix Name | `string` | `"nat"` | no |
| <a name="input_nat_rt_prefix"></a> [nat\_rt\_prefix](#input\_nat\_rt\_prefix) | NAT Routing Table Prefix Name | `string` | `"nat-rt"` | no |
| <a name="input_peer_owner_id"></a> [peer\_owner\_id](#input\_peer\_owner\_id) | Core Infrastrucre VPC Peers Owner ID | `map(string)` | <pre>{<br/>  "default": "1234567890",<br/>  "lab": "1234567890",<br/>  "nonprod": "1234567890",<br/>  "prod": "0987654321",<br/>  "staging": "1234567890"<br/>}</pre> | no |
| <a name="input_propagating_vgws"></a> [propagating\_vgws](#input\_propagating\_vgws) | Core Infrastrucre VPC Gateway Propagating | `map(string)` | <pre>{<br/>  "default": "vgw-1234567890",<br/>  "lab": "vgw-1234567890",<br/>  "nonprod": "vgw-1234567890",<br/>  "prod": "vgw-0987654321",<br/>  "staging": "vgw-1234567890"<br/>}</pre> | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | Core Infrastrucre CIDR Block | `map(string)` | <pre>{<br/>  "default": "10.16.0.0/16",<br/>  "lab": "10.16.0.0/16",<br/>  "nonprod": "10.32.0.0/16",<br/>  "prod": "10.48.0.0/16",<br/>  "staging": "10.32.0.0/16"<br/>}</pre> | no |
| <a name="input_vpc_peer"></a> [vpc\_peer](#input\_vpc\_peer) | Core Infrastrucre VPC Peers ID | `map(string)` | <pre>{<br/>  "default": "vpc-1234567890",<br/>  "lab": "vpc-1234567890",<br/>  "nonprod": "vpc-1234567890",<br/>  "prod": "vpc-0987654321",<br/>  "staging": "vpc-1234567890"<br/>}</pre> | no |
| <a name="input_workspace_env"></a> [workspace\_env](#input\_workspace\_env) | Workspace Environment Selection | `map(string)` | <pre>{<br/>  "default": "default",<br/>  "lab": "rnd",<br/>  "nonprod": "nonprod",<br/>  "prod": "prod",<br/>  "staging": "staging"<br/>}</pre> | no |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | Workspace Environment Name | `string` | `"default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eks_private_1a"></a> [eks\_private\_1a](#output\_eks\_private\_1a) | Private Subnet EKS Zone A |
| <a name="output_eks_private_1a_cidr"></a> [eks\_private\_1a\_cidr](#output\_eks\_private\_1a\_cidr) | Private Subnet EKS CIDR Block of Zone A |
| <a name="output_eks_private_1b"></a> [eks\_private\_1b](#output\_eks\_private\_1b) | Private Subnet EKS Zone B |
| <a name="output_eks_private_1b_cidr"></a> [eks\_private\_1b\_cidr](#output\_eks\_private\_1b\_cidr) | Private Subnet EKS CIDR Block of Zone B |
| <a name="output_eks_private_1c"></a> [eks\_private\_1c](#output\_eks\_private\_1c) | Private Subnet EKS Zone C |
| <a name="output_eks_private_1c_cidr"></a> [eks\_private\_1c\_cidr](#output\_eks\_private\_1c\_cidr) | Private Subnet EKS CIDR Block of Zone C |
| <a name="output_eks_public_1a"></a> [eks\_public\_1a](#output\_eks\_public\_1a) | Public Subnet EKS Zone A |
| <a name="output_eks_public_1a_cidr"></a> [eks\_public\_1a\_cidr](#output\_eks\_public\_1a\_cidr) | Public Subnet EKS CIDR Block of Zone A |
| <a name="output_eks_public_1b"></a> [eks\_public\_1b](#output\_eks\_public\_1b) | Public Subnet EKS Zone B |
| <a name="output_eks_public_1b_cidr"></a> [eks\_public\_1b\_cidr](#output\_eks\_public\_1b\_cidr) | Public Subnet EKS CIDR Block of Zone B |
| <a name="output_eks_public_1c"></a> [eks\_public\_1c](#output\_eks\_public\_1c) | Public Subnet EKS Zone C |
| <a name="output_eks_public_1c_cidr"></a> [eks\_public\_1c\_cidr](#output\_eks\_public\_1c\_cidr) | Public Subnet EKS CIDR Block of Zone C |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | Security Group of VPC Id's |
| <a name="output_summary"></a> [summary](#output\_summary) | Summary Core Infrastructure Configuration |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | VPC CIDR Block |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC Identity |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | VPC Name |
<!-- END_TF_DOCS -->