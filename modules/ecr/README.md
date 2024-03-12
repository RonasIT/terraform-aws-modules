<!-- BEGIN_TF_DOCS -->


## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecr"></a> [ecr](#module\_ecr) | terraform-aws-modules/ecr/aws | ~> 1.6 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_developer_role_arn"></a> [developer\_role\_arn](#input\_developer\_role\_arn) | ARN of the role for Developer users that will have access to repository | `string` | n/a | yes |
| <a name="input_gitlab_user_arn"></a> [gitlab\_user\_arn](#input\_gitlab\_user\_arn) | ARN of gitlab user that will have access to repository | `string` | n/a | yes |
| <a name="input_repository_names"></a> [repository\_names](#input\_repository\_names) | List of ECR repository names | `list(string)` | n/a | yes |
| <a name="input_teamlead_role_arn"></a> [teamlead\_role\_arn](#input\_teamlead\_role\_arn) | ARN of the role for Teamlead users that will have access to repository | `string` | n/a | yes |
<!-- END_TF_DOCS -->