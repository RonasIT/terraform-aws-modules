output "cluster_autoscaler_role_arn" {
  value       = module.cluster_autoscaler_irsa[0].iam_role_arn
  description = "ARN of the role for cluster autoscaler role"
}
