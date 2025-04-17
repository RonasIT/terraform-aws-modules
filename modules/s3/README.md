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
| [aws_s3_bucket_acl.artifacts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_cors_configuration.cors_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_cors_configuration) | resource |
| [aws_s3_bucket_ownership_controls.artifacts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.gitlab_runner](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.artifacts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_public_access_block.gitlab_runner](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_artifacts_bucket_acls"></a> [allow\_artifacts\_bucket\_acls](#input\_allow\_artifacts\_bucket\_acls) | Allow individual ACLs for artifacts bucket and create corresponding bucket ownership controls | `bool` | `false` | no |
| <a name="input_artifacts_bucket_name"></a> [artifacts\_bucket\_name](#input\_artifacts\_bucket\_name) | The name of a bucket for storing application artifacts, including user uploads, cache, etc. | `string` | `"artifacts"` | no |
| <a name="input_cors_config_enabled"></a> [cors\_config\_enabled](#input\_cors\_config\_enabled) | Flag to enable/disable creation of CORS config | `bool` | `false` | no |
| <a name="input_create_gitlab_runner_bucket"></a> [create\_gitlab\_runner\_bucket](#input\_create\_gitlab\_runner\_bucket) | Flag to enable/disable creation of dedicated bucket for gitlab-runner cache | `bool` | `true` | no |
| <a name="input_gitlab_runner_bucket_name"></a> [gitlab\_runner\_bucket\_name](#input\_gitlab\_runner\_bucket\_name) | The name of a dedicated bucket for storing gitlab-runner cache. | `string` | `"gitlab-runner-cache"` | no |
| <a name="input_gitlab_runner_user_arn"></a> [gitlab\_runner\_user\_arn](#input\_gitlab\_runner\_user\_arn) | ARN of gitlab-runner user that will have access to bucket. Required if `create_gitlab_runner_bucket` is true. | `string` | `""` | no |
| <a name="input_s3_cors_configuration"></a> [s3\_cors\_configuration](#input\_s3\_cors\_configuration) | n/a | <pre>object({<br/>    allowed_headers = list(string)<br/>    allowed_methods = list(string)<br/>    allowed_origins = list(string)<br/>    expose_headers  = list(string)<br/>    max_age_seconds = number<br/>  })</pre> | <pre>{<br/>  "allowed_headers": [<br/>    "*"<br/>  ],<br/>  "allowed_methods": [<br/>    "GET",<br/>    "PUT",<br/>    "POST",<br/>    "HEAD",<br/>    "DELETE"<br/>  ],<br/>  "allowed_origins": [<br/>    "*"<br/>  ],<br/>  "expose_headers": [],<br/>  "max_age_seconds": 3000<br/>}</pre> | no |
<!-- END_TF_DOCS -->