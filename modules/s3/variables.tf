variable "artifacts_bucket_name" {
  default     = "artifacts"
  description = "The name of a bucket for storing application artifacts, including user uploads, cache, etc."
  type        = string
}

variable "gitlab_runner_bucket_name" {
  default     = "gitlab-runner-cache"
  description = "The name of a dedicated bucket for storing gitlab-runner cache"
  type        = string
}

variable "gitlab_runner_user_arn" {
  description = "ARN of gitlab-runner user that will have access to bucket"
  type        = string
}
