output "cluster_autoscaler_role_arn" {
  value       = module.cluster_autoscaler_irsa[0].iam_role_arn
  description = "ARN of the role for cluster autoscaler role"
}

output "nlb_arn" {
  value       = aws_lb.k8s-nlb.arn
  description = "ARN of the nlb that was created"
}

output "loadbalancer_controller_role_arn" {
  value       = module.loadbalancer_controller_irsa[0].iam_role_arn
  description = "ARN of the role for loadbalancer-controller role"
}
