# Terraform IAM User for 098765432101

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
| <a name="module_iam-user"></a> [iam-user](#module\_iam-user) | ../../../../modules//iam-user | n/a |

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
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region | `string` | `"ap-southeast-3"` | no |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | The AWS Secret Key | `string` | `""` | no |
| <a name="input_dci_team_administrator"></a> [dci\_team\_administrator](#input\_dci\_team\_administrator) | DCI Administrator Team Member | `list(any)` | <pre>[<br/>  "administrator.01@devopscorner.id",<br/>  "administrator.02@devopscorner.id"<br/>]</pre> | no |
| <a name="input_dci_team_billing"></a> [dci\_team\_billing](#input\_dci\_team\_billing) | DCI Billing Team Member | `list(any)` | <pre>[<br/>  "billing.01@devopscorner.id",<br/>  "billing.02@devopscorner.id"<br/>]</pre> | no |
| <a name="input_dci_team_developer"></a> [dci\_team\_developer](#input\_dci\_team\_developer) | DCI Developer Team Member | `list(any)` | <pre>[<br/>  "developer.01@devopscorner.id",<br/>  "developer.02@devopscorner.id"<br/>]</pre> | no |
| <a name="input_department"></a> [department](#input\_department) | Department Owner | `string` | `"DEVOPS"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Target Environment (tags) | `map(string)` | <pre>{<br/>  "default": "DEF",<br/>  "lab": "RND",<br/>  "prod": "PROD",<br/>  "staging": "STG"<br/>}</pre> | no |
| <a name="input_group_dci_administrator"></a> [group\_dci\_administrator](#input\_group\_dci\_administrator) | Administrator Group Name | `string` | `"awscb-administrator"` | no |
| <a name="input_group_dci_billing"></a> [group\_dci\_billing](#input\_group\_dci\_billing) | Billing Group Name | `string` | `"awscb-billing"` | no |
| <a name="input_group_dci_developer"></a> [group\_dci\_developer](#input\_group\_dci\_developer) | Developer Group Name | `string` | `"awscb-developer"` | no |
| <a name="input_kms_env"></a> [kms\_env](#input\_kms\_env) | KMS Key Environment | `map(string)` | <pre>{<br/>  "lab": "RnD",<br/>  "nonprod": "NonProduction",<br/>  "prod": "Production",<br/>  "staging": "Staging"<br/>}</pre> | no |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | KMS Key References | `map(string)` | <pre>{<br/>  "default": "arn:aws:kms:ap-southeast-3:098765432101:key/HASH_KEY",<br/>  "lab": "arn:aws:kms:ap-southeast-3:098765432101:key/HASH_KEY",<br/>  "prod": "arn:aws:kms:ap-southeast-3:098765432101:key/HASH_KEY",<br/>  "staging": "arn:aws:kms:ap-southeast-3:098765432101:key/HASH_KEY"<br/>}</pre> | no |
| <a name="input_policy_dci_administrator"></a> [policy\_dci\_administrator](#input\_policy\_dci\_administrator) | Administrator Policy Name | `string` | `"awscb-administrator-policy"` | no |
| <a name="input_policy_dci_billing"></a> [policy\_dci\_billing](#input\_policy\_dci\_billing) | Billing Policy Name | `string` | `"awscb-billing-policy"` | no |
| <a name="input_policy_dci_developer"></a> [policy\_dci\_developer](#input\_policy\_dci\_developer) | Developer Policy Name | `string` | `"awscb-developer-policy"` | no |
| <a name="input_tf_user_executor"></a> [tf\_user\_executor](#input\_tf\_user\_executor) | TF User Executor | `string` | `"TF-User-Executor-098765432101"` | no |
| <a name="input_workspace_env"></a> [workspace\_env](#input\_workspace\_env) | Workspace Environment Selection | `map(string)` | <pre>{<br/>  "default": "default",<br/>  "lab": "rnd",<br/>  "prod": "prod",<br/>  "staging": "staging"<br/>}</pre> | no |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | Workspace Environment Name | `string` | `"default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dci_admin_group_arn"></a> [dci\_admin\_group\_arn](#output\_dci\_admin\_group\_arn) | Administrator Group ARN |
| <a name="output_dci_admin_group_name"></a> [dci\_admin\_group\_name](#output\_dci\_admin\_group\_name) | Administrator Group Name |
| <a name="output_dci_billing_group_arn"></a> [dci\_billing\_group\_arn](#output\_dci\_billing\_group\_arn) | Billing Group ARN |
| <a name="output_dci_billing_group_name"></a> [dci\_billing\_group\_name](#output\_dci\_billing\_group\_name) | Billing Group Name |
| <a name="output_dci_developer_group_arn"></a> [dci\_developer\_group\_arn](#output\_dci\_developer\_group\_arn) | Developer Group ARN |
| <a name="output_dci_developer_group_name"></a> [dci\_developer\_group\_name](#output\_dci\_developer\_group\_name) | Developer Group Name |
| <a name="output_dci_developer_policy"></a> [dci\_developer\_policy](#output\_dci\_developer\_policy) | DCI Developer Policy Name |
| <a name="output_dci_developer_policy_arn"></a> [dci\_developer\_policy\_arn](#output\_dci\_developer\_policy\_arn) | DCI Developer Policy ARN |
| <a name="output_list_dci_administrator"></a> [list\_dci\_administrator](#output\_list\_dci\_administrator) | DCI Administrator Account |
| <a name="output_list_dci_billing"></a> [list\_dci\_billing](#output\_list\_dci\_billing) | DCI Billing Account |
| <a name="output_list_dci_developer"></a> [list\_dci\_developer](#output\_list\_dci\_developer) | DCI Developer Account |
| <a name="output_summary"></a> [summary](#output\_summary) | Summary IAM User Configuration |
<!-- END_TF_DOCS -->