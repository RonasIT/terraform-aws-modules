variable "cert_manager_enabled" {
  type        = bool
  default     = true
  description = "Deploy cert-manager into cluster (https://cert-manager.io/)"
}

variable "ingress_nginx_enabled" {
  type        = bool
  default     = true
  description = "Deploy ingress-nginx into cluster (https://kubernetes.github.io/ingress-nginx/)"
}
