## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.46.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.13.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.29.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.46.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.13.1 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.29.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_addon.coredns](https://registry.terraform.io/providers/hashicorp/aws/5.46.0/docs/resources/eks_addon) | resource |
| [aws_eks_addon.kube_proxy](https://registry.terraform.io/providers/hashicorp/aws/5.46.0/docs/resources/eks_addon) | resource |
| [aws_iam_policy.eks_cluster_autoscaler_policy](https://registry.terraform.io/providers/hashicorp/aws/5.46.0/docs/resources/iam_policy) | resource |
| [aws_iam_policy.eks_load_balancer_policy](https://registry.terraform.io/providers/hashicorp/aws/5.46.0/docs/resources/iam_policy) | resource |
| [aws_iam_policy.vpc_cni_policy](https://registry.terraform.io/providers/hashicorp/aws/5.46.0/docs/resources/iam_policy) | resource |
| [aws_iam_role.eks_cluster_autoscaler_role](https://registry.terraform.io/providers/hashicorp/aws/5.46.0/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_load_balancer_role](https://registry.terraform.io/providers/hashicorp/aws/5.46.0/docs/resources/iam_role) | resource |
| [aws_iam_role.vpc_cni_role](https://registry.terraform.io/providers/hashicorp/aws/5.46.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.attach_cluster_autoscaler_role_policy](https://registry.terraform.io/providers/hashicorp/aws/5.46.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.attach_load_balancer_controller_role_policy](https://registry.terraform.io/providers/hashicorp/aws/5.46.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.attach_vpc_cni_role_policy](https://registry.terraform.io/providers/hashicorp/aws/5.46.0/docs/resources/iam_role_policy_attachment) | resource |
| [helm_release.autoscaler](https://registry.terraform.io/providers/hashicorp/helm/2.13.1/docs/resources/release) | resource |
| [helm_release.aws_load_balancer_controller](https://registry.terraform.io/providers/hashicorp/helm/2.13.1/docs/resources/release) | resource |
| [helm_release.ingress_gateway](https://registry.terraform.io/providers/hashicorp/helm/2.13.1/docs/resources/release) | resource |
| [helm_release.kube_dashboard](https://registry.terraform.io/providers/hashicorp/helm/2.13.1/docs/resources/release) | resource |
| [helm_release.kubecost](https://registry.terraform.io/providers/hashicorp/helm/2.13.1/docs/resources/release) | resource |
| [helm_release.metrics_server](https://registry.terraform.io/providers/hashicorp/helm/2.13.1/docs/resources/release) | resource |
| [helm_release.opencost](https://registry.terraform.io/providers/hashicorp/helm/2.13.1/docs/resources/release) | resource |
| [helm_release.vpc_cni](https://registry.terraform.io/providers/hashicorp/helm/2.13.1/docs/resources/release) | resource |
| [kubernetes_cluster_role.dashboard_admin](https://registry.terraform.io/providers/hashicorp/kubernetes/2.29.0/docs/resources/cluster_role) | resource |
| [kubernetes_cluster_role_binding.dashboard_admin](https://registry.terraform.io/providers/hashicorp/kubernetes/2.29.0/docs/resources/cluster_role_binding) | resource |
| [kubernetes_ingress_v1.kube_dashboard](https://registry.terraform.io/providers/hashicorp/kubernetes/2.29.0/docs/resources/ingress_v1) | resource |
| [kubernetes_secret.dashboard_admin](https://registry.terraform.io/providers/hashicorp/kubernetes/2.29.0/docs/resources/secret) | resource |
| [kubernetes_service_account.dashboard_admin](https://registry.terraform.io/providers/hashicorp/kubernetes/2.29.0/docs/resources/service_account) | resource |
| [kubernetes_service_account_v1.aws_cluster_autoscaler_sa](https://registry.terraform.io/providers/hashicorp/kubernetes/2.29.0/docs/resources/service_account_v1) | resource |
| [kubernetes_service_account_v1.aws_load_balancer_sa](https://registry.terraform.io/providers/hashicorp/kubernetes/2.29.0/docs/resources/service_account_v1) | resource |
| [kubernetes_service_account_v1.vpc_cni_sa](https://registry.terraform.io/providers/hashicorp/kubernetes/2.29.0/docs/resources/service_account_v1) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/5.46.0/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster.default](https://registry.terraform.io/providers/hashicorp/aws/5.46.0/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.default](https://registry.terraform.io/providers/hashicorp/aws/5.46.0/docs/data-sources/eks_cluster_auth) | data source |
| [aws_security_group.sg_node](https://registry.terraform.io/providers/hashicorp/aws/5.46.0/docs/data-sources/security_group) | data source |
| [aws_subnet.subnet_details](https://registry.terraform.io/providers/hashicorp/aws/5.46.0/docs/data-sources/subnet) | data source |
| [aws_subnets.subnets](https://registry.terraform.io/providers/hashicorp/aws/5.46.0/docs/data-sources/subnets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_controller_enable"></a> [alb\_controller\_enable](#input\_alb\_controller\_enable) | aws\_load\_balancer\_controller | `bool` | `false` | no |
| <a name="input_alb_controller_version"></a> [alb\_controller\_version](#input\_alb\_controller\_version) | n/a | `string` | `null` | no |
| <a name="input_autoscaler_enable"></a> [autoscaler\_enable](#input\_autoscaler\_enable) | autoscaler | `bool` | `false` | no |
| <a name="input_autoscaler_version"></a> [autoscaler\_version](#input\_autoscaler\_version) | n/a | `string` | `null` | no |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | n/a | `string` | `""` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_coredns_enable"></a> [coredns\_enable](#input\_coredns\_enable) | coredns | `bool` | `false` | no |
| <a name="input_coredns_version"></a> [coredns\_version](#input\_coredns\_version) | n/a | `string` | `null` | no |
| <a name="input_kube_dashboard_enable"></a> [kube\_dashboard\_enable](#input\_kube\_dashboard\_enable) | kube\_dashboard | `bool` | `false` | no |
| <a name="input_kube_dashboard_ingress_class"></a> [kube\_dashboard\_ingress\_class](#input\_kube\_dashboard\_ingress\_class) | n/a | `string` | `null` | no |
| <a name="input_kube_dashboard_url"></a> [kube\_dashboard\_url](#input\_kube\_dashboard\_url) | n/a | `string` | `""` | no |
| <a name="input_kube_dashboard_version"></a> [kube\_dashboard\_version](#input\_kube\_dashboard\_version) | n/a | `string` | `null` | no |
| <a name="input_kube_proxy_enable"></a> [kube\_proxy\_enable](#input\_kube\_proxy\_enable) | kube\_proxy | `bool` | `false` | no |
| <a name="input_kube_proxy_version"></a> [kube\_proxy\_version](#input\_kube\_proxy\_version) | n/a | `string` | `null` | no |
| <a name="input_kubecost_enable"></a> [kubecost\_enable](#input\_kubecost\_enable) | kubecost | `bool` | `false` | no |
| <a name="input_kubecost_ingress_class"></a> [kubecost\_ingress\_class](#input\_kubecost\_ingress\_class) | n/a | `string` | `null` | no |
| <a name="input_kubecost_url"></a> [kubecost\_url](#input\_kubecost\_url) | n/a | `string` | `""` | no |
| <a name="input_kubecost_version"></a> [kubecost\_version](#input\_kubecost\_version) | n/a | `string` | `null` | no |
| <a name="input_metrics_server_enable"></a> [metrics\_server\_enable](#input\_metrics\_server\_enable) | metrics\_server | `bool` | `false` | no |
| <a name="input_metrics_server_version"></a> [metrics\_server\_version](#input\_metrics\_server\_version) | n/a | `string` | `null` | no |
| <a name="input_nginx_controler_enable"></a> [nginx\_controler\_enable](#input\_nginx\_controler\_enable) | nginx\_controler | `bool` | `false` | no |
| <a name="input_nginx_controler_version"></a> [nginx\_controler\_version](#input\_nginx\_controler\_version) | n/a | `string` | `null` | no |
| <a name="input_opencost_enable"></a> [opencost\_enable](#input\_opencost\_enable) | opencost | `bool` | `false` | no |
| <a name="input_opencost_ingress_class"></a> [opencost\_ingress\_class](#input\_opencost\_ingress\_class) | n/a | `string` | `null` | no |
| <a name="input_opencost_url"></a> [opencost\_url](#input\_opencost\_url) | n/a | `string` | `""` | no |
| <a name="input_opencost_version"></a> [opencost\_version](#input\_opencost\_version) | n/a | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | cluster\_eks | `string` | n/a | yes |
| <a name="input_sg_filter_name"></a> [sg\_filter\_name](#input\_sg\_filter\_name) | n/a | `string` | `null` | no |
| <a name="input_subnets_filter_name"></a> [subnets\_filter\_name](#input\_subnets\_filter\_name) | n/a | `string` | `null` | no |
| <a name="input_vpc_cni_enable"></a> [vpc\_cni\_enable](#input\_vpc\_cni\_enable) | vpc\_cni | `bool` | `false` | no |
| <a name="input_vpc_cni_version"></a> [vpc\_cni\_version](#input\_vpc\_cni\_version) | n/a | `string` | `null` | no |

## Outputs

No outputs.
