variable "artifacts_bucket_name" {
  default     = "artifacts"
  description = "The name of a bucket for storing application artifacts, including user uploads, cache, etc."
  type        = string
}

variable "create_gitlab_runner_bucket" {
  default     = true
  description = "Flag to enable/disable creation of dedicated bucket for gitlab-runner cache"
  type        = bool
}

variable "gitlab_runner_bucket_name" {
  description = "The name of a dedicated bucket for storing gitlab-runner cache."
  type        = string
  default     = "gitlab-runner-cache"
}

variable "gitlab_runner_user_arn" {
  default     = ""
  description = "ARN of gitlab-runner user that will have access to bucket. Required if `create_gitlab_runner_bucket` is true."
  type        = string
}

variable "allow_artifacts_bucket_acls" {
  description = "Allow individual ACLs for artifacts bucket and create corresponding bucket ownership controls"
  type        = bool
  default     = false
}
