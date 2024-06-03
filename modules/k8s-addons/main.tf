resource "helm_release" "cert_manager" {
  count = var.cert_manager_enabled ? 1 : 0

  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  namespace        = "cert-manager"
  version          = var.cert_manager_chart_version
  create_namespace = true

  dynamic "set" {
    for_each = concat(var.cert_manager_set_values, var.cert_manager_additional_set)
    content {
      name  = set.value.name
      value = set.value.value
      type  = lookup(set.value, "type", "string")
    }
  }
}

resource "helm_release" "ingress_nginx" {
  count = var.ingress_nginx_enabled ? 1 : 0

  name             = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  version          = var.ingress_nginx_chart_version
  create_namespace = true

  dynamic "set" {
    for_each = concat(var.ingress_nginx_set_values, var.ingress_nginx_additional_set)
    content {
      name  = set.value.name
      value = set.value.value
      type  = lookup(set.value, "type", "string")
    }
  }
}

resource "helm_release" "metrics_server" {
  count = var.metrics_server_enabled ? 1 : 0

  name             = "metrics-server"
  repository       = "https://kubernetes-sigs.github.io/metrics-server/"
  chart            = "metrics-server"
  namespace        = "kube-system"
  version          = var.metrics_server_chart_version
  create_namespace = false

  dynamic "set" {
    for_each = concat(var.metrics_server_set_values, var.metrics_server_additional_set)
    content {
      name  = set.value.name
      value = set.value.value
      type  = lookup(set.value, "type", "string")
    }
  }
}

resource "helm_release" "aws_load_balancer_controller" {
  count = var.aws_load_balancer_controller_enabled ? 1 : 0

  name             = "aws-load-balancer-controller"
  repository       = "https://aws.github.io/eks-charts"
  chart            = "aws-load-balancer-controller"
  namespace        = "kube-system"
  version          = var.aws_load_balancer_controller_chart_version
  create_namespace = true

  dynamic "set" {
    for_each = concat(var.aws_load_balancer_controller_set_values, var.aws_load_balancer_controller_additional_set)
    content {
      name  = set.value.name
      value = set.value.value
      type  = lookup(set.value, "type", "string")
    }
  }
}
