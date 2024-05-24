variable "cert_manager_enabled" {
  type        = bool
  default     = true
  description = "Deploy cert-manager into cluster (https://cert-manager.io/)"
}

variable "cert_manager_chart_version" {
  type        = string
  default     = "v1.14.3"
  description = "Cert Manager Helm chart version"
}

variable "cert_manager_set_values" {
  type = map(string)
  default = {
    "installCRDs" = "true"
  }
  description = "Set values for cert-manager Helm chart"
}

variable "ingress_nginx_enabled" {
  type        = bool
  default     = true
  description = "Deploy ingress-nginx into cluster (https://kubernetes.github.io/ingress-nginx/)"
}

variable "ingress_nginx_chart_version" {
  type        = string
  default     = "4.10.0"
  description = "Ingress NGINX Helm chart version"
}

variable "ingress_nginx_set_values" {
  type = map(string)
  default = {
    "controller.allowSnippetAnnotations" = "true",
    "controller.proxy-body-size"         = "100m"
  }
  description = "Set values for ingress-nginx Helm chart"
}


variable "metrics_server_enabled" {
  type        = bool
  default     = true
  description = "Deploy metrics-server into cluster (https://github.com/kubernetes-sigs/metrics-server)"
}

variable "metrics_server_application_version" {
  type        = string
  default     = "0.7.1"
  description = "Metrics Server application version"
}

variable "metrics_server_chart_version" {
  type        = string
  default     = "3.12.1"
  description = "Metrics Server Helm chart version"
}

variable "metrics_server_set_values" {
  type        = map(string)
  default     = {}
  description = "Set values for metrics-server Helm chart"
}
