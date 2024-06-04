<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cluster_autoscaler_irsa"></a> [cluster\_autoscaler\_irsa](#module\_cluster\_autoscaler\_irsa) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | 5.37.1 |
| <a name="module_loadbalancer_controller_irsa"></a> [loadbalancer\_controller\_irsa](#module\_loadbalancer\_controller\_irsa) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | 5.37.1 |

## Resources

| Name | Type |
|------|------|
| [aws_eks_access_entry.developers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_access_entry) | resource |
| [aws_eks_access_entry.gitlab](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_access_entry) | resource |
| [aws_eks_access_entry.teamleads](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_access_entry) | resource |
| [aws_eks_access_policy_association.developers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_access_policy_association) | resource |
| [aws_eks_access_policy_association.gitlab](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_access_policy_association) | resource |
| [aws_eks_access_policy_association.teamleads](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_access_policy_association) | resource |
| [aws_lb.k8s-nlb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.k8s-tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the EKS cluster for which permissions will be granted | `string` | n/a | yes |
| <a name="input_create_cluster_autoscaler_role"></a> [create\_cluster\_autoscaler\_role](#input\_create\_cluster\_autoscaler\_role) | Whether to enable creation of cluster-autoscaler irsa role | `bool` | `true` | no |
| <a name="input_create_loadbalancer_controller_role"></a> [create\_loadbalancer\_controller\_role](#input\_create\_loadbalancer\_controller\_role) | Whether to enable creation of aws-loadbalancer-controller irsa role | `bool` | `true` | no |
| <a name="input_developer_role_arn"></a> [developer\_role\_arn](#input\_developer\_role\_arn) | ARN of the role for Developer users, granting Cluster Viewer permissions | `string` | n/a | yes |
| <a name="input_gitlab_user_arn"></a> [gitlab\_user\_arn](#input\_gitlab\_user\_arn) | ARN of the GitLab user for authentication purposes | `string` | n/a | yes |
| <a name="input_nlb_public_subnets"></a> [nlb\_public\_subnets](#input\_nlb\_public\_subnets) | The public subnets for the NLB | `list(string)` | n/a | yes |
| <a name="input_oidc_provider"></a> [oidc\_provider](#input\_oidc\_provider) | Address of the OIDC provider used for authentication in the EKS cluster account | `string` | n/a | yes |
| <a name="input_oidc_provider_arn"></a> [oidc\_provider\_arn](#input\_oidc\_provider\_arn) | ARN of the OIDC provider used for authentication in the EKS cluster account | `string` | n/a | yes |
| <a name="input_teamlead_role_arn"></a> [teamlead\_role\_arn](#input\_teamlead\_role\_arn) | ARN of the role for Teamlead users, granting Cluster Admin permissions | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC to create resources in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_autoscaler_role_arn"></a> [cluster\_autoscaler\_role\_arn](#output\_cluster\_autoscaler\_role\_arn) | ARN of the role for cluster autoscaler role |
| <a name="output_loadbalancer_controller_role_arn"></a> [loadbalancer\_controller\_role\_arn](#output\_loadbalancer\_controller\_role\_arn) | ARN of the role for loadbalancer-controller role |
| <a name="output_nlb_arn"></a> [nlb\_arn](#output\_nlb\_arn) | n/a |
<!-- END_TF_DOCS -->