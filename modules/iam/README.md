<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_allow_assume_teamleads_iam_policy"></a> [allow\_assume\_teamleads\_iam\_policy](#module\_allow\_assume\_teamleads\_iam\_policy) | terraform-aws-modules/iam/aws//modules/iam-policy | 5.34.0 |
| <a name="module_allow_eks_access_iam_policy"></a> [allow\_eks\_access\_iam\_policy](#module\_allow\_eks\_access\_iam\_policy) | terraform-aws-modules/iam/aws//modules/iam-policy | 5.34.0 |
| <a name="module_developer_group"></a> [developer\_group](#module\_developer\_group) | terraform-aws-modules/iam/aws//modules/iam-group-with-policies | 5.34.0 |
| <a name="module_developer_users"></a> [developer\_users](#module\_developer\_users) | terraform-aws-modules/iam/aws//modules/iam-user | 5.34.0 |
| <a name="module_developers_iam_role"></a> [developers\_iam\_role](#module\_developers\_iam\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | 5.34.0 |
| <a name="module_gitlab"></a> [gitlab](#module\_gitlab) | terraform-aws-modules/iam/aws//modules/iam-user | 5.34.0 |
| <a name="module_gitlab_runner_user"></a> [gitlab\_runner\_user](#module\_gitlab\_runner\_user) | terraform-aws-modules/iam/aws//modules/iam-user | 5.34.0 |
| <a name="module_storage"></a> [storage](#module\_storage) | terraform-aws-modules/iam/aws//modules/iam-user | 5.34.0 |
| <a name="module_teamlead_group"></a> [teamlead\_group](#module\_teamlead\_group) | terraform-aws-modules/iam/aws//modules/iam-group-with-policies | 5.34.0 |
| <a name="module_teamlead_users"></a> [teamlead\_users](#module\_teamlead\_users) | terraform-aws-modules/iam/aws//modules/iam-user | 5.34.0 |
| <a name="module_teamleads_iam_role"></a> [teamleads\_iam\_role](#module\_teamleads\_iam\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | 5.34.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_group_membership.developer_group_membership](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_membership.teamlead_group_membership](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_policy.developer_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.ecr_read_only_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.storage_s3_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user_policy_attachment.storage_s3_access_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_developer_members"></a> [developer\_members](#input\_developer\_members) | The usernames of members in the developer group (not emails) | `list(string)` | n/a | yes |
| <a name="input_teamlead_members"></a> [teamlead\_members](#input\_teamlead\_members) | The usernames of members in the teamlead group (not emails) | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_developer_users"></a> [developer\_users](#output\_developer\_users) | Account data to use by developers |
| <a name="output_developers_iam_role"></a> [developers\_iam\_role](#output\_developers\_iam\_role) | Developer role details to use in other modules |
| <a name="output_ecr_read_only_policy_arn"></a> [ecr\_read\_only\_policy\_arn](#output\_ecr\_read\_only\_policy\_arn) | ARN of the ECR read-only access policy to attach to EKS nodes |
| <a name="output_gitlab_runner_user"></a> [gitlab\_runner\_user](#output\_gitlab\_runner\_user) | Account data to use inside gitlab-runner configuration to access cache storage |
| <a name="output_gitlab_user"></a> [gitlab\_user](#output\_gitlab\_user) | Account data to use inside CI/CD jobs in GitLab CI |
| <a name="output_storage_user_access_key_id"></a> [storage\_user\_access\_key\_id](#output\_storage\_user\_access\_key\_id) | n/a |
| <a name="output_storage_user_access_key_secret"></a> [storage\_user\_access\_key\_secret](#output\_storage\_user\_access\_key\_secret) | n/a |
| <a name="output_teamlead_users"></a> [teamlead\_users](#output\_teamlead\_users) | Account data to use by teamleads |
| <a name="output_teamleads_iam_role"></a> [teamleads\_iam\_role](#output\_teamleads\_iam\_role) | Teamlead role details to use in other modules |
<!-- END_TF_DOCS -->