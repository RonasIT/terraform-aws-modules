output "storage_user_access_key_id" {
  value = {
    key_id = module.storage.iam_access_key_id
  }
  sensitive = true
}

output "storage_user_access_key_secret" {
  value = {
    key = module.storage.iam_access_key_secret
  }
  sensitive = true
}

output "gitlab_user" {
  value       = module.gitlab
  description = "Account data to use inside CI/CD jobs in GitLab CI"
  sensitive   = true
}

output "gitlab_runner_user" {
  value       = module.gitlab_runner_user
  description = "Account data to use inside gitlab-runner configuration to access cache storage"
  sensitive   = true
}

output "developer_users" {
  value       = module.developer_users
  description = "Account data to use by developers"
  sensitive   = true
}

output "teamlead_users" {
  value       = module.teamlead_users
  description = "Account data to use by teamleads"
  sensitive   = true
}

output "teamleads_iam_role" {
  value       = module.teamleads_iam_role
  description = "Teamlead role details to use in other modules"
  sensitive   = false
}

output "developers_iam_role" {
  value       = module.developers_iam_role
  description = "Developer role details to use in other modules"
  sensitive   = false
}

output "ecr_read_only_policy_arn" {
  value       = aws_iam_policy.ecr_read_only_policy.arn
  description = "ARN of the ECR read-only access policy to attach to EKS nodes"
  sensitive   = false
}

output "additional_service_account_arns" {
  description = "The ARNs of the created IAM users"
  value       = { for user, cfg in aws_iam_user.additional_service_accounts : user => cfg.arn }

}

output "additional_service_accounts_access_keys" {
  description = "Access keys for additional service accounts"
  value = { for user, key in aws_iam_access_key.additional_service_accounts_access_keys : user => {
    access_key_id     = key.id
    secret_access_key = key.secret
    }
  }
  sensitive = true
}
