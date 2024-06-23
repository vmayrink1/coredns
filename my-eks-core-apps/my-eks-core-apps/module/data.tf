
data "aws_caller_identity" "current" {}

data "aws_eks_cluster" "default" {
  name = local.cluster_name
}

data "aws_eks_cluster_auth" "default" {
  name = local.cluster_name
}

locals {
  region       = var.region
  cluster_name = var.cluster_name
  oidc         = substr(data.aws_eks_cluster.default.identity[0].oidc[0].issuer, 8, length(data.aws_eks_cluster.default.identity[0].oidc[0].issuer))
  account_id   = data.aws_caller_identity.current.account_id
  vpc_id       = data.aws_eks_cluster.default.vpc_config[0].vpc_id
}


