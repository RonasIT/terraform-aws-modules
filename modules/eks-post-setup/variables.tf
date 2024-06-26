variable "cluster_name" {
  description = "Name of the EKS cluster for which permissions will be granted"
  type        = string
}

variable "teamlead_role_arn" {
  description = "ARN of the role for Teamlead users, granting Cluster Admin permissions"
  type        = string
}

variable "developer_role_arn" {
  description = "ARN of the role for Developer users, granting Cluster Viewer permissions"
  type        = string
}

variable "gitlab_user_arn" {
  description = "ARN of the GitLab user for authentication purposes"
  type        = string
}

variable "oidc_provider" {
  description = "Address of the OIDC provider used for authentication in the EKS cluster account"
  type        = string
}

variable "oidc_provider_arn" {
  description = "ARN of the OIDC provider used for authentication in the EKS cluster account"
  type        = string
}

variable "create_cluster_autoscaler_role" {
  type        = bool
  default     = true
  description = "Whether to enable creation of cluster-autoscaler irsa role"
}

variable "create_loadbalancer_controller_role" {
  type        = bool
  default     = true
  description = "Whether to enable creation of aws-loadbalancer-controller irsa role"
}

variable "nlb_public_subnets" {
  description = "The public subnets for the NLB"
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC to create resources in"
  type        = string
}
