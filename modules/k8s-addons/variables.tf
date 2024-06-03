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
  description = "Default set values for cert-manager Helm chart"
  type = list(object({
    name  = string,
    value = string,
    type  = optional(string)
  }))
  default = [
    {
      name  = "installCRDs",
      value = "true",
      type  = "string"
    }
  ]
}


variable "cert_manager_additional_set" {
  description = "Optional additional set values for cert-manager Helm chart"
  type = list(object({
    name  = string,
    value = string,
    type  = optional(string)
  }))
  default = []
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
  description = "Optional additional set values for ingress-nginx Helm chart"
  type = list(object({
    name  = string,
    value = string,
    type  = optional(string)
  }))
  default = [
    {
      name  = "controller.resources.limits.cpu",
      value = "125m",
      type  = "string"
    },
    {
      name  = "controller.resources.limits.memory",
      value = "175Mi",
      type  = "string"
    },
    {
      name  = "controller.config.proxy-body-size",
      value = "100m",
      type  = "string"
    },
    {
      name  = "controller.addHeaders.x-robots-tag",
      value = "noindex",
      type  = "string"
    }
  ]
}

variable "ingress_nginx_additional_set" {
  description = "Optional additional set values for cert-manager Helm chart"
  type = list(object({
    name  = string,
    value = string,
    type  = optional(string)
  }))
  default = []
}

variable "metrics_server_enabled" {
  type        = bool
  default     = true
  description = "Deploy metrics-server into cluster (https://github.com/kubernetes-sigs/metrics-server)"
}

variable "metrics_server_chart_version" {
  type        = string
  default     = "3.12.1"
  description = "Metrics Server Helm chart version"
}

variable "metrics_server_set_values" {
  description = "Default set values for metrics-server Helm chart"
  type = list(object({
    name  = string,
    value = string,
    type  = optional(string)
  }))
  default = []
}

variable "metrics_server_additional_set" {
  description = "Optional additional set values for metrics-server Helm chart"
  type = list(object({
    name  = string,
    value = string,
    type  = optional(string)
  }))
  default = []
}
