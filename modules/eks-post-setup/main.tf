resource "aws_eks_access_entry" "teamleads" {
  cluster_name      = var.cluster_name
  principal_arn     = var.teamlead_role_arn
  kubernetes_groups = []
  type              = "STANDARD"
}

resource "aws_eks_access_policy_association" "teamleads" {
  cluster_name = var.cluster_name
  policy_arn   = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  principal_arn = var.teamlead_role_arn

  access_scope {
    type = "cluster"
  }
}

resource "aws_eks_access_entry" "developers" {
  cluster_name      = var.cluster_name
  principal_arn     = var.developer_role_arn
  kubernetes_groups = []
  type              = "STANDARD"
}

resource "aws_eks_access_policy_association" "developers" {
  cluster_name = var.cluster_name
  policy_arn   = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"

  principal_arn = var.developer_role_arn

  access_scope {
    type = "cluster"
  }
}

resource "aws_eks_access_entry" "gitlab" {
  cluster_name      = var.cluster_name
  principal_arn     = var.gitlab_user_arn
  kubernetes_groups = []
  type              = "STANDARD"
}

resource "aws_eks_access_policy_association" "gitlab" {
  cluster_name = var.cluster_name
  policy_arn   = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  principal_arn = var.gitlab_user_arn

  access_scope {
    type = "cluster"
  }
}

module "cluster_autoscaler_irsa" {
  source      = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version     = "5.37.1"
  create_role = true
  role_name   = "AmazonEKSClusterAutoscalerRole"

  attach_cluster_autoscaler_policy = true
  cluster_autoscaler_cluster_names = ["${var.cluster_name}"]

  oidc_providers = {
    main = {
      provider_arn               = "${var.oidc_provider_arn}"
      namespace_service_accounts = ["kube-system:cluster-autoscaler"]
    }
  }
}
