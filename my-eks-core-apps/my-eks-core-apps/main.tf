module "eks_core_apps" {
  source       = "./module"
  region       = "ca-central-1"
  cluster_name = ""

  # kube_proxy - https://docs.aws.amazon.com/pt_br/eks/latest/userguide/managing-kube-proxy.html
  kube_proxy_enable  = false
  kube_proxy_version = "v1.29.3-eksbuild.2" # null = default version

  # coredns - https://docs.aws.amazon.com/pt_br/eks/latest/userguide/managing-coredns.html
  coredns_enable  = false
  coredns_version = "v1.11.1-eksbuild.6" # null = default version

  # vpc_cni - https://artifacthub.io/packages/helm/aws/aws-vpc-cni
  vpc_cni_enable      = false
  vpc_cni_version     = "1.18.0"
  subnets_filter_name = "" # subnets da rede CNI
  sg_filter_name      = "" # sg do node

  # aws_load_balancer_controller - https://artifacthub.io/packages/helm/aws/aws-load-balancer-controller 
  # kubectl apply -k "github.com/aws/eks-charts/stable/aws-load-balancer-controller/crds?ref=master"
  alb_controller_enable  = false
  alb_controller_version = "1.7.1"

  # autoscaler - https://artifacthub.io/packages/helm/cluster-autoscaler/cluster-autoscaler
  autoscaler_enable  = false
  autoscaler_version = "9.36.0"

  # metrics_server - https://artifacthub.io/packages/helm/metrics-server/metrics-server
  metrics_server_enable  = false
  metrics_server_version = "3.12.1"

  # nginx_controler - https://artifacthub.io/packages/helm/ingress-nginx/ingress-nginx
  nginx_controler_enable  = false
  certificate_arn         = ""
  nginx_controler_version = "4.10.0"

  # kube_dashboard - https://artifacthub.io/packages/helm/k8s-dashboard/kubernetes-dashboard
  kube_dashboard_enable        = false
  kube_dashboard_version       = "7.3.2"
  kube_dashboard_ingress_class = "nginx"
  kube_dashboard_url           = ""

  # kubecost - https://artifacthub.io/packages/helm/kubecost/cost-analyzer
  kubecost_enable        = false
  kubecost_version       = "2.2.2"
  csi_driver_version     = "2.31.0"
  kubecost_ingress_class = "nginx"
  kubecost_url           = ""
}