resource "helm_release" "ingress_nginx" {
  count = var.ingress_nginx_enabled ? 1 : 0

  name             = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  version          = var.ingress_nginx_chart_version
  create_namespace = true

  dynamic "set" {
    for_each = var.ingress_nginx_set_values
    content {
      name  = set.key
      value = set.value
    }
  }
}

resource "helm_release" "cert_manager" {
  count = var.cert_manager_enabled ? 1 : 0

  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  namespace        = "cert-manager"
  version          = var.cert_manager_chart_version
  create_namespace = true

  dynamic "set" {
    for_each = var.cert_manager_set_values
    content {
      name  = set.key
      value = set.value
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
    for_each = var.metrics_server_set_values
    content {
      name  = set.key
      value = set.value
    }
  }
}
