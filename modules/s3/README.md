<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.artifacts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.gitlab_runner](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.artifacts_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_policy.gitlab_runner](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.artifacts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_public_access_block.gitlab_runner](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_artifacts_bucket_name"></a> [artifacts\_bucket\_name](#input\_artifacts\_bucket\_name) | The name of a bucket for storing application artifacts, including user uploads, cache, etc. | `string` | `"artifacts"` | no |
| <a name="input_gitlab_runner_bucket_name"></a> [gitlab\_runner\_bucket\_name](#input\_gitlab\_runner\_bucket\_name) | The name of a dedicated bucket for storing gitlab-runner cache | `string` | `"gitlab-runner-cache"` | no |
| <a name="input_gitlab_runner_user_arn"></a> [gitlab\_runner\_user\_arn](#input\_gitlab\_runner\_user\_arn) | ARN of gitlab-runner user that will have access to bucket | `string` | n/a | yes |
<!-- END_TF_DOCS -->