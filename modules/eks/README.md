# Terraform Module EKS

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.72 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.76.0 |
| <a name="provider_aws.destination"></a> [aws.destination](#provider\_aws.destination) | 5.76.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.3 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.6 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | github.com/terraform-aws-modules/terraform-aws-s3-bucket.git | v3.15.2 |

## Resources

| Name | Type |
|------|------|
| [aws_eks_addon.coredns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.ebs_csi_driver](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.efs_csi_driver](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.kube_proxy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.pod_identity_agent](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.snapshot_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.vpc_cni](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_cluster.aws_eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.devops](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_eks_pod_identity_association.ebs_csi_driver](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_pod_identity_association) | resource |
| [aws_eks_pod_identity_association.efs_csi_driver](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_pod_identity_association) | resource |
| [aws_iam_openid_connect_provider.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.ebs_csi_driver_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.efs_csi_driver_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.load_balancer_controller_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.route53_cert_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.cluster_autoscaler_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.ebs_csi_pod_identity_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.efs_csi_pod_identity_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_nodes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.iam_eks_bucket_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.aws_loadbalancer_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.cluster_autoscaler_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.node_autoscaler_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.ebs_csi_driver_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.efs_csi_driver_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_iam_cluster_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_iam_cni_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_iam_container_registry_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_iam_service_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_iam_worker_node_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.load_balancer_controller_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.route53_cert_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lb_target_group.devops](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.eks_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [random_pet.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_canonical_user_id.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/canonical_user_id) | data source |
| [aws_cloudfront_log_delivery_canonical_user_id.cloudfront](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/cloudfront_log_delivery_canonical_user_id) | data source |
| [aws_iam_policy_document.eks_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_kms_key.cmk_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_vpc.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [terraform_remote_state.core_state](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [tls_certificate.cluster](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_my_ip"></a> [access\_my\_ip](#input\_access\_my\_ip) | Your IP Address | `string` | n/a | yes |
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | The AWS Access Key | `string` | n/a | yes |
| <a name="input_aws_account_id_destination"></a> [aws\_account\_id\_destination](#input\_aws\_account\_id\_destination) | The AWS Account ID to deploy the Budget in | `string` | n/a | yes |
| <a name="input_aws_account_id_source"></a> [aws\_account\_id\_source](#input\_aws\_account\_id\_source) | The AWS Account ID management | `string` | n/a | yes |
| <a name="input_aws_account_profile_destination"></a> [aws\_account\_profile\_destination](#input\_aws\_account\_profile\_destination) | The AWS Profile to deploy the Budget in | `string` | n/a | yes |
| <a name="input_aws_account_profile_source"></a> [aws\_account\_profile\_source](#input\_aws\_account\_profile\_source) | The AWS Profile management | `string` | n/a | yes |
| <a name="input_aws_az"></a> [aws\_az](#input\_aws\_az) | AWS Zone Target Deployment | `map(string)` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to deploy the VPC certificate in | `string` | n/a | yes |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | The AWS Secret Key | `string` | n/a | yes |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Bucket Name | `string` | n/a | yes |
| <a name="input_cert_manager_version"></a> [cert\_manager\_version](#input\_cert\_manager\_version) | Cert Manager addon version per environment | `map(string)` | <pre>{<br/>  "lab": "v1.18.1-eksbuild.1",<br/>  "prod": "v1.18.1-eksbuild.1",<br/>  "staging": "v1.18.1-eksbuild.1"<br/>}</pre> | no |
| <a name="input_coredns_version"></a> [coredns\_version](#input\_coredns\_version) | CoreDNS addon version per environment | `map(string)` | <pre>{<br/>  "lab": "v1.11.4-eksbuild.14",<br/>  "prod": "v1.11.4-eksbuild.14",<br/>  "staging": "v1.11.4-eksbuild.14"<br/>}</pre> | no |
| <a name="input_department"></a> [department](#input\_department) | Department Owner | `string` | n/a | yes |
| <a name="input_dns_url"></a> [dns\_url](#input\_dns\_url) | DNS URL EKS | `map(string)` | n/a | yes |
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | DNS Zone EKS | `map(string)` | n/a | yes |
| <a name="input_ebs_csi_driver_version"></a> [ebs\_csi\_driver\_version](#input\_ebs\_csi\_driver\_version) | EBS CSI driver version per environment | `map(string)` | <pre>{<br/>  "lab": "v1.45.0-eksbuild.2",<br/>  "prod": "v1.45.0-eksbuild.2",<br/>  "staging": "v1.45.0-eksbuild.2"<br/>}</pre> | no |
| <a name="input_efs_csi_driver_version"></a> [efs\_csi\_driver\_version](#input\_efs\_csi\_driver\_version) | EFS CSI driver version per environment | `map(string)` | <pre>{<br/>  "lab": "v2.1.8-eksbuild.1",<br/>  "prod": "v2.1.8-eksbuild.1",<br/>  "staging": "v2.1.8-eksbuild.1"<br/>}</pre> | no |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | Default cluster name | `string` | n/a | yes |
| <a name="input_eks_name_env"></a> [eks\_name\_env](#input\_eks\_name\_env) | Default EKS environment name | `map(string)` | <pre>{<br/>  "lab": "lab",<br/>  "prod": "prod",<br/>  "staging": "staging"<br/>}</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Target Environment (tags) | `map(string)` | n/a | yes |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Default EKS version | `map(string)` | <pre>{<br/>  "lab": "1.32",<br/>  "prod": "1.32",<br/>  "staging": "1.32"<br/>}</pre> | no |
| <a name="input_kms_env"></a> [kms\_env](#input\_kms\_env) | KMS Key Environment | `map(string)` | n/a | yes |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | KMS Key References | `map(string)` | n/a | yes |
| <a name="input_kube_proxy_version"></a> [kube\_proxy\_version](#input\_kube\_proxy\_version) | Kube Proxy addon version per environment | `map(string)` | <pre>{<br/>  "lab": "v1.32.5-eksbuild.2",<br/>  "prod": "v1.32.5-eksbuild.2",<br/>  "staging": "v1.32.5-eksbuild.2"<br/>}</pre> | no |
| <a name="input_kube_state_metrics_version"></a> [kube\_state\_metrics\_version](#input\_kube\_state\_metrics\_version) | Kube State Metrics addon version per environment | `map(string)` | <pre>{<br/>  "lab": "v2.15.0-eksbuild.5",<br/>  "prod": "v2.15.0-eksbuild.5",<br/>  "staging": "v2.15.0-eksbuild.5"<br/>}</pre> | no |
| <a name="input_metrics_server_version"></a> [metrics\_server\_version](#input\_metrics\_server\_version) | Metrics Server addon version per environment | `map(string)` | <pre>{<br/>  "lab": "v0.7.2-eksbuild.4",<br/>  "prod": "v0.7.2-eksbuild.4",<br/>  "staging": "v0.7.2-eksbuild.4"<br/>}</pre> | no |
| <a name="input_pod_identity_agent_version"></a> [pod\_identity\_agent\_version](#input\_pod\_identity\_agent\_version) | Pod Identity Agent addon version per environment | `map(string)` | <pre>{<br/>  "lab": "v1.3.7-eksbuild.2",<br/>  "prod": "v1.3.7-eksbuild.2",<br/>  "staging": "v1.3.7-eksbuild.2"<br/>}</pre> | no |
| <a name="input_snapshot_controller_version"></a> [snapshot\_controller\_version](#input\_snapshot\_controller\_version) | Snapshot Controller addon version per environment | `map(string)` | <pre>{<br/>  "lab": "v8.2.0-eksbuild.1",<br/>  "prod": "v8.2.0-eksbuild.1",<br/>  "staging": "v8.2.0-eksbuild.1"<br/>}</pre> | no |
| <a name="input_ssh_key_pair"></a> [ssh\_key\_pair](#input\_ssh\_key\_pair) | Default keyname | `map(string)` | n/a | yes |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | SSH Public Key | `string` | n/a | yes |
| <a name="input_vpc_cni_version"></a> [vpc\_cni\_version](#input\_vpc\_cni\_version) | Amazon VPC CNI addon version per environment | `map(string)` | <pre>{<br/>  "lab": "v1.19.6-eksbuild.1",<br/>  "prod": "v1.19.6-eksbuild.1",<br/>  "staging": "v1.19.6-eksbuild.1"<br/>}</pre> | no |
| <a name="input_vpn_infra"></a> [vpn\_infra](#input\_vpn\_infra) | VPN Infra | `map(string)` | n/a | yes |
| <a name="input_workspace_env"></a> [workspace\_env](#input\_workspace\_env) | Workspace Environment Selection | `map(string)` | n/a | yes |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | Workspace Environment Name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_config_map_aws_auth"></a> [config\_map\_aws\_auth](#output\_config\_map\_aws\_auth) | -------------------------------------------------------------------------- EKS Config Map Auth -------------------------------------------------------------------------- |
| <a name="output_coredns_addon_arn"></a> [coredns\_addon\_arn](#output\_coredns\_addon\_arn) | ARN of the CoreDNS addon |
| <a name="output_ebs_csi_addon_arn"></a> [ebs\_csi\_addon\_arn](#output\_ebs\_csi\_addon\_arn) | ARN of the EBS CSI driver addon |
| <a name="output_ebs_csi_driver_policy_arn"></a> [ebs\_csi\_driver\_policy\_arn](#output\_ebs\_csi\_driver\_policy\_arn) | ARN of the EBS CSI driver IAM policy |
| <a name="output_ebs_csi_driver_role_arn"></a> [ebs\_csi\_driver\_role\_arn](#output\_ebs\_csi\_driver\_role\_arn) | ARN of the EBS CSI driver IAM role |
| <a name="output_ebs_csi_pod_identity_association_arn"></a> [ebs\_csi\_pod\_identity\_association\_arn](#output\_ebs\_csi\_pod\_identity\_association\_arn) | ARN of the EBS CSI driver pod identity association |
| <a name="output_efs_csi_addon_arn"></a> [efs\_csi\_addon\_arn](#output\_efs\_csi\_addon\_arn) | ARN of the EFS CSI driver addon |
| <a name="output_efs_csi_driver_policy_arn"></a> [efs\_csi\_driver\_policy\_arn](#output\_efs\_csi\_driver\_policy\_arn) | ARN of the EFS CSI driver IAM policy |
| <a name="output_efs_csi_driver_role_arn"></a> [efs\_csi\_driver\_role\_arn](#output\_efs\_csi\_driver\_role\_arn) | ARN of the EFS CSI driver IAM role |
| <a name="output_efs_csi_pod_identity_association_arn"></a> [efs\_csi\_pod\_identity\_association\_arn](#output\_efs\_csi\_pod\_identity\_association\_arn) | ARN of the EFS CSI driver pod identity association |
| <a name="output_eks_cluster_certificat_authority"></a> [eks\_cluster\_certificat\_authority](#output\_eks\_cluster\_certificat\_authority) | -------------------------------------------------------------------------- EKS Cluster Certificate Authority -------------------------------------------------------------------------- |
| <a name="output_eks_cluster_endpoint"></a> [eks\_cluster\_endpoint](#output\_eks\_cluster\_endpoint) | -------------------------------------------------------------------------- EKS Cluster Endpoint -------------------------------------------------------------------------- |
| <a name="output_eks_cluster_name"></a> [eks\_cluster\_name](#output\_eks\_cluster\_name) | -------------------------------------------------------------------------- EKS Cluster Name -------------------------------------------------------------------------- |
| <a name="output_eks_node_name_devops_app"></a> [eks\_node\_name\_devops\_app](#output\_eks\_node\_name\_devops\_app) | -------------------------------------------------------------------------- Node Group Output -------------------------------------------------------------------------- # App Output # |
| <a name="output_eks_node_tg_devops_app"></a> [eks\_node\_tg\_devops\_app](#output\_eks\_node\_tg\_devops\_app) | -------------------------------------------------------------------------- Target Group Output -------------------------------------------------------------------------- # Monitoring TargetGroup Output ## |
| <a name="output_eks_security_group"></a> [eks\_security\_group](#output\_eks\_security\_group) | -------------------------------------------------------------------------- EKS Security Group -------------------------------------------------------------------------- |
| <a name="output_eks_vpc_id"></a> [eks\_vpc\_id](#output\_eks\_vpc\_id) | -------------------------------------------------------------------------- EKS VPC -------------------------------------------------------------------------- |
| <a name="output_kube_proxy_addon_arn"></a> [kube\_proxy\_addon\_arn](#output\_kube\_proxy\_addon\_arn) | ARN of the Kube Proxy addon |
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | -------------------------------------------------------------------------- EKS Kube Config -------------------------------------------------------------------------- |
| <a name="output_pod_identity_agent_addon_arn"></a> [pod\_identity\_agent\_addon\_arn](#output\_pod\_identity\_agent\_addon\_arn) | ARN of the Pod Identity Agent addon |
| <a name="output_vpc_cni_addon_arn"></a> [vpc\_cni\_addon\_arn](#output\_vpc\_cni\_addon\_arn) | ARN of the Amazon VPC CNI addon |
<!-- END_TF_DOCS -->