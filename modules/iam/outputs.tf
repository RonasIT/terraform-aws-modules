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

output "ecr_pull_policy_arn" {
  value       = aws_iam_policy.ecr_policy.arn
  description = "ECR access policy ARN to attach to EKS nodes"
  sensitive   = false
}
