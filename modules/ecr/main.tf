module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "~> 1.6"

  for_each = toset(var.repository_names)

  repository_name                 = each.value
  repository_image_scan_on_push   = false
  repository_image_tag_mutability = "MUTABLE"

  repository_lifecycle_policy = jsonencode({
    "rules" : [
      {
        "rulePriority" : 2,
        "description" : "keep production images",
        "selection" : {
          "tagStatus" : "tagged",
          "tagPrefixList" : ["production"],
          "countType" : "imageCountMoreThan",
          "countNumber" : 9999
        },
        "action" : {
          "type" : "expire"
        }
      },
      {
        "rulePriority" : 3,
        "description" : "keep staging images",
        "selection" : {
          "tagStatus" : "tagged",
          "tagPrefixList" : ["staging"],
          "countType" : "imageCountMoreThan",
          "countNumber" : 9999
        },
        "action" : {
          "type" : "expire"
        }
      },
      {
        "rulePriority" : 4,
        "description" : "keep development images",
        "selection" : {
          "tagStatus" : "tagged",
          "tagPrefixList" : ["development"],
          "countType" : "imageCountMoreThan",
          "countNumber" : 9999
        },
        "action" : {
          "type" : "expire"
        }
      },
      {
        "rulePriority" : 5,
        "description" : "remove old images",
        "selection" : {
          "tagStatus" : "any",
          "countType" : "imageCountMoreThan",
          "countNumber" : 10
        },
        "action" : {
          "type" : "expire"
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
