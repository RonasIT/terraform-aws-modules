variable "repository_names" {
  type        = list(string)
  description = "List of ECR repository names"
}

variable "teamlead_role_arn" {
  description = "ARN of the role for Teamlead users that will have access to repository"
  type        = string
}

variable "developer_role_arn" {
  description = "ARN of the role for Developer users that will have access to repository"
  type        = string
}

variable "gitlab_user_arn" {
  description = "ARN of gitlab user that will have access to repository"
  type        = string
}
