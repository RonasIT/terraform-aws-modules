<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

## Resources

| Name | Type |
|------|------|
| [helm_release.aws_load_balancer_controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.cert_manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.ingress_nginx](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.metrics_server](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_load_balancer_controller_additional_set"></a> [aws\_load\_balancer\_controller\_additional\_set](#input\_aws\_load\_balancer\_controller\_additional\_set) | Optional additional set values for AWS Load Balancer Controller Helm chart | <pre>list(object({<br>    name  = string,<br>    value = string,<br>    type  = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_aws_load_balancer_controller_chart_version"></a> [aws\_load\_balancer\_controller\_chart\_version](#input\_aws\_load\_balancer\_controller\_chart\_version) | AWS Load Balancer Controller Helm chart version | `string` | `"1.8.1"` | no |
| <a name="input_aws_load_balancer_controller_enabled"></a> [aws\_load\_balancer\_controller\_enabled](#input\_aws\_load\_balancer\_controller\_enabled) | Enable deployment of the AWS Load Balancer Controller into the cluster | `bool` | `true` | no |
| <a name="input_aws_load_balancer_controller_set_values"></a> [aws\_load\_balancer\_controller\_set\_values](#input\_aws\_load\_balancer\_controller\_set\_values) | Default set values for AWS Load Balancer Controller Helm chart | <pre>list(object({<br>    name  = string,<br>    value = string,<br>    type  = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_cert_manager_additional_set"></a> [cert\_manager\_additional\_set](#input\_cert\_manager\_additional\_set) | Optional additional set values for cert-manager Helm chart | <pre>list(object({<br>    name  = string,<br>    value = string,<br>    type  = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_cert_manager_chart_version"></a> [cert\_manager\_chart\_version](#input\_cert\_manager\_chart\_version) | Cert Manager Helm chart version | `string` | `"v1.14.3"` | no |
| <a name="input_cert_manager_enabled"></a> [cert\_manager\_enabled](#input\_cert\_manager\_enabled) | Deploy cert-manager into cluster (https://cert-manager.io/) | `bool` | `true` | no |
| <a name="input_cert_manager_set_values"></a> [cert\_manager\_set\_values](#input\_cert\_manager\_set\_values) | Default set values for cert-manager Helm chart | <pre>list(object({<br>    name  = string,<br>    value = string,<br>    type  = optional(string)<br>  }))</pre> | <pre>[<br>  {<br>    "name": "installCRDs",<br>    "type": "string",<br>    "value": "true"<br>  }<br>]</pre> | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the EKS cluster to create resources in | `string` | n/a | yes |
| <a name="input_ingress_nginx_additional_set"></a> [ingress\_nginx\_additional\_set](#input\_ingress\_nginx\_additional\_set) | Optional additional set values for cert-manager Helm chart | <pre>list(object({<br>    name  = string,<br>    value = string,<br>    type  = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_ingress_nginx_chart_version"></a> [ingress\_nginx\_chart\_version](#input\_ingress\_nginx\_chart\_version) | Ingress NGINX Helm chart version | `string` | `"4.10.0"` | no |
| <a name="input_ingress_nginx_enabled"></a> [ingress\_nginx\_enabled](#input\_ingress\_nginx\_enabled) | Deploy ingress-nginx into cluster (https://kubernetes.github.io/ingress-nginx/) | `bool` | `true` | no |
| <a name="input_ingress_nginx_set_values"></a> [ingress\_nginx\_set\_values](#input\_ingress\_nginx\_set\_values) | Optional additional set values for ingress-nginx Helm chart | <pre>list(object({<br>    name  = string,<br>    value = string,<br>    type  = optional(string)<br>  }))</pre> | <pre>[<br>  {<br>    "name": "controller.resources.limits.cpu",<br>    "type": "string",<br>    "value": "125m"<br>  },<br>  {<br>    "name": "controller.resources.limits.memory",<br>    "type": "string",<br>    "value": "175Mi"<br>  },<br>  {<br>    "name": "controller.config.proxy-body-size",<br>    "type": "string",<br>    "value": "100m"<br>  },<br>  {<br>    "name": "controller.addHeaders.x-robots-tag",<br>    "type": "string",<br>    "value": "noindex"<br>  }<br>]</pre> | no |
| <a name="input_metrics_server_additional_set"></a> [metrics\_server\_additional\_set](#input\_metrics\_server\_additional\_set) | Optional additional set values for metrics-server Helm chart | <pre>list(object({<br>    name  = string,<br>    value = string,<br>    type  = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_metrics_server_chart_version"></a> [metrics\_server\_chart\_version](#input\_metrics\_server\_chart\_version) | Metrics Server Helm chart version | `string` | `"3.12.1"` | no |
| <a name="input_metrics_server_enabled"></a> [metrics\_server\_enabled](#input\_metrics\_server\_enabled) | Deploy metrics-server into cluster (https://github.com/kubernetes-sigs/metrics-server) | `bool` | `true` | no |
| <a name="input_metrics_server_set_values"></a> [metrics\_server\_set\_values](#input\_metrics\_server\_set\_values) | Default set values for metrics-server Helm chart | <pre>list(object({<br>    name  = string,<br>    value = string,<br>    type  = optional(string)<br>  }))</pre> | `[]` | no |
<!-- END_TF_DOCS -->