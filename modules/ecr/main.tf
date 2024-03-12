module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "~> 1.6"

  for_each = toset(var.repository_names)

  repository_name                 = each.value
  repository_image_scan_on_push   = false
  repository_image_tag_mutability = "MUTABLE"

  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 1 images for each 'development', 'staging', 'production'",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["development", "staging", "production"],
          countType     = "imageCountMoreThan",
          countNumber   = 1
        },
        action = {
          type = "expire"
        }
      },
      {
        rulePriority = 2,
        description  = "Keep last 10 images",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["v"],
          countType     = "imageCountMoreThan",
          countNumber   = 10
        },
        action = {
          type = "expire"
        }
      }
    ]
  })


  repository_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "FullAccessPolicy",
        Effect = "Allow",
        Principal = {
          AWS = [
            var.teamlead_role_arn,
            var.developer_role_arn,
            var.gitlab_user_arn,
          ]
        },
        Action = "ecr:*"
      }
    ]
  })

}
