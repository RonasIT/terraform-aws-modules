#create user to interact with storage subsystem
module "storage" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "5.34.0"

  name = "storage"
}

#create user for gitlab-runner to store cache in s3
module "gitlab_runner_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "5.34.0"

  name = "gitlab-runner"
}

#create policy allowing interaction with s3
resource "aws_iam_policy" "storage_s3_access" {
  name        = "StorageS3ReadWriteAccess"
  description = "Policy that allows storage user read/write permissions on s3, but not creation/deletion (Managed by Terraform)"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = "s3:*",
        Resource = [
          "arn:aws:s3:::*",
          "arn:aws:s3:::*/*"
        ]
      },
      {
        Effect = "Deny",
        Action = [
          "s3:CreateBucket",
          "s3:DeleteBucket"
        ],
        Resource = "arn:aws:s3:::*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "storage_s3_access_attachment" {
  user       = "storage"
  policy_arn = aws_iam_policy.storage_s3_access.arn
}

#create user for gitlab and give it AdministratorAccess policy association
module "gitlab" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "5.34.0"

  name        = "gitlab"
  policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]
}


#developers
#create developer users from the input
module "developer_users" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "5.34.0"

  for_each = { for username in var.developer_members : username => { name = username } }
  name     = each.value.name
}

#create policy with neccessary permissions for developers 
resource "aws_iam_policy" "developer_policy" {
  name        = "DeveloperPolicy"
  path        = "/"
  description = "Policy that allows developers to connect to all EKS clusters and assume the 'Developers' role (Managed by Terraform)"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = "eks:DescribeCluster",
        Effect   = "Allow",
        Resource = "*"
      },
      {
        Action   = "sts:AssumeRole",
        Effect   = "Allow",
        Resource = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/Developers"
      }
    ]
  })
}

#create group for developer users, attaching their policy to it
module "developer_group" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "5.34.0"

  name                              = "Developers"
  custom_group_policy_arns          = [aws_iam_policy.developer_policy.arn]
  enable_mfa_enforcement            = false
  attach_iam_self_management_policy = false #true blocks all actions except for setting up mfa
}


#add developer users to the group
resource "aws_iam_group_membership" "developer_group_membership" {
  name = "developer-membership"

  users = values(module.developer_users)[*].iam_user_name
  group = module.developer_group.group_name
}

#create neccessary iam role
module "developers_iam_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.34.0"

  role_name         = "Developers"
  create_role       = true
  role_requires_mfa = false

  custom_role_policy_arns = [aws_iam_policy.developer_policy.arn]

  trusted_role_arns = [
    "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
  ]
}


#teamleads
#create teamlead users from the input
module "teamlead_users" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "5.34.0"

  for_each = { for username in var.teamlead_members : username => { name = username } }
  name     = each.value.name
}


#create group for teamlead users, attaching their policy to it
module "teamlead_group" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "5.34.0"

  name                              = "Teamleads"
  custom_group_policy_arns          = ["arn:aws:iam::aws:policy/AdministratorAccess", module.allow_assume_teamleads_iam_policy.arn]
  enable_mfa_enforcement            = false
  attach_iam_self_management_policy = false #true blocks all actions except for setting up mfa
}

#add teamlead users to the group
resource "aws_iam_group_membership" "teamlead_group_membership" {
  name = "teamlead-membership"

  users = values(module.teamlead_users)[*].iam_user_name
  group = module.teamlead_group.group_name
}

#make users able to actually connect to the cluster 
module "allow_eks_access_iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.34.0"

  name          = "allow-eks-access"
  create_policy = true

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "eks:DescribeCluster",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

data "aws_caller_identity" "current" {}


#create neccessary iam role
module "teamleads_iam_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.34.0"

  role_name         = "Teamleads"
  create_role       = true
  role_requires_mfa = false

  custom_role_policy_arns = [module.allow_eks_access_iam_policy.arn]

  trusted_role_arns = [
    "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
  ]
}

module "allow_assume_teamleads_iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.34.0"

  name          = "allow-assume-teamleads-iam-role"
  create_policy = true

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
        ]
        Effect   = "Allow"
        Resource = module.teamleads_iam_role.iam_role_arn
      },
    ]
  })
}

resource "aws_iam_policy" "ecr_read_only_policy" {
  name        = "ECRReadOnly"
  description = "Policy to allow read access to ECR by EKS. Managed by Terraform."

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability",
          "ecr:DescribeRepositories",
          "ecr:ListImages",
          "ecr:DescribeImages",
        ],
        Resource = "*"
      },
    ],
  })
}
