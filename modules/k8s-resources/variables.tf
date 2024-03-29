variable "cluster_name" {
  description = "The EKS cluster name for deploying resources (must be accessable)"
  type        = string
}

variable "maintainer_email" {
  description = "The email address to be utilized for certificate generation through cert-manage"
  type        = string
}

variable "cluster_autoscaler_role_arn" {
  description = "ARN of cluster autoscaler role to use for annotating cluster-autoscaler service account"
  type        = string
}
