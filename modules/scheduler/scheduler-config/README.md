# Terraform Module EC2 Scheduler Config

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.72 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.81.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.cross_account_scheduler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.cross_account_scheduler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_ssm_parameter.environment_schedules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | The AWS Access Key | `string` | n/a | yes |
| <a name="input_aws_account_id_destination"></a> [aws\_account\_id\_destination](#input\_aws\_account\_id\_destination) | The AWS Account ID to deploy S3 Logs | `string` | n/a | yes |
| <a name="input_aws_account_id_source"></a> [aws\_account\_id\_source](#input\_aws\_account\_id\_source) | The AWS Account ID management | `string` | n/a | yes |
| <a name="input_aws_account_profile_destination"></a> [aws\_account\_profile\_destination](#input\_aws\_account\_profile\_destination) | The AWS Profile to deploy S3 Logs in | `string` | n/a | yes |
| <a name="input_aws_account_profile_source"></a> [aws\_account\_profile\_source](#input\_aws\_account\_profile\_source) | The AWS Profile management | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region | `string` | n/a | yes |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | The AWS Secret Key | `string` | n/a | yes |
| <a name="input_department"></a> [department](#input\_department) | Department Owner | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Target Environment (tags) | `map(string)` | n/a | yes |
| <a name="input_environment_schedules"></a> [environment\_schedules](#input\_environment\_schedules) | Schedule configurations for different environments | <pre>map(object({<br/>    start_time = string<br/>    stop_time  = string<br/>    time_zone  = string<br/>    work_days  = list(string)<br/>    exceptions = list(string)<br/>    instance_tags = map(string)<br/>  }))</pre> | n/a | yes |
| <a name="input_kms_env"></a> [kms\_env](#input\_kms\_env) | KMS Key Environment | `map(string)` | n/a | yes |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | KMS Key References | `map(string)` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Resource name prefix | `string` | `"ec2-scheduler"` | no |
| <a name="input_workspace_env"></a> [workspace\_env](#input\_workspace\_env) | Workspace Environment Selection | `map(string)` | n/a | yes |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | Workspace Environment Name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cross_account_role_arn"></a> [cross\_account\_role\_arn](#output\_cross\_account\_role\_arn) | ARN of the cross-account scheduler role |
| <a name="output_parameter_arns"></a> [parameter\_arns](#output\_parameter\_arns) | ARNs of created SSM parameters |
| <a name="output_schedule_configurations"></a> [schedule\_configurations](#output\_schedule\_configurations) | Map of environment schedule configurations |
<!-- END_TF_DOCS -->