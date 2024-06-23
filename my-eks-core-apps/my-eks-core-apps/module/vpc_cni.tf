resource "helm_release" "vpc_cni" {
  count      = var.vpc_cni_enable ? 1 : 0
  name       = "aws-vpc-cni"
  chart      = "aws-vpc-cni"
  repository = "https://aws.github.io/eks-charts"
  version    = var.vpc_cni_version
  namespace  = "kube-system"
  values = [
    templatefile("./module/helm-values/values-cni.yaml", {
      region   = "${local.region}"
      sg_node  = "${local.sg_node}"
      subnet_1 = "${local.subnet_1}"
      subnet_2 = "${local.subnet_2}"
      subnet_3 = "${local.subnet_3}"
      az_1     = "${local.az_1}"
      az_2     = "${local.az_2}"
      az_3     = "${local.az_3}"
    })
  ]
}

data "aws_security_group" "sg_node" {
  count = var.vpc_cni_enable ? 1 : 0
  filter {
    name   = "tag:Name"
    values = ["*${var.sg_filter_name}*"]
  }
}

data "aws_subnets" "subnets" {
  count = var.vpc_cni_enable ? 1 : 0
  filter {
    name   = "tag:Name"
    values = ["*${var.subnets_filter_name}*"]
  }
}

data "aws_subnet" "subnet_details" {
  count = var.vpc_cni_enable ? length(data.aws_subnets.subnets[0].ids) : 0
  id    = var.vpc_cni_enable ? element(data.aws_subnets.subnets[0].ids, count.index) : null
}

locals {
  subnet_1 = var.vpc_cni_enable ? data.aws_subnet.subnet_details[0].id : null
  subnet_2 = var.vpc_cni_enable ? data.aws_subnet.subnet_details[1].id : null
  subnet_3 = var.vpc_cni_enable ? data.aws_subnet.subnet_details[2].id : null

  az_1 = var.vpc_cni_enable ? data.aws_subnet.subnet_details[0].availability_zone : null
  az_2 = var.vpc_cni_enable ? data.aws_subnet.subnet_details[1].availability_zone : null
  az_3 = var.vpc_cni_enable ? data.aws_subnet.subnet_details[2].availability_zone : null

  sg_node = var.vpc_cni_enable ? data.aws_security_group.sg_node[0].id : null
}



resource "kubernetes_service_account_v1" "vpc_cni_sa" {
  count = var.vpc_cni_enable ? 1 : 0
  metadata {
    name      = "aws-node-terraform"
    namespace = "kube-system"
    labels = {
      "app.kubernetes.io/component" = "controller"
      "app.kubernetes.io/name"      = "aws-node-terraform"
    }
    annotations = {
      "eks.amazonaws.com/role-arn" = "arn:aws:iam::${local.account_id}:role/${aws_iam_role.vpc_cni_role[count.index].name}"
    }
  }
}

resource "aws_iam_role" "vpc_cni_role" {
  count = var.vpc_cni_enable ? 1 : 0

  name = "AmazonEKS_CNI_Role_terraform"
  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : {
            "Federated" : "arn:aws:iam::${local.account_id}:oidc-provider/${local.oidc}"
          },
          "Action" : "sts:AssumeRoleWithWebIdentity",
          "Condition" : {
            "StringEquals" : {
              "${local.oidc}:aud" : "sts.amazonaws.com",
              "${local.oidc}:sub" : "system:serviceaccount:kube-system:aws-node-terraform"
            }
          }
        }
      ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_vpc_cni_role_policy" {
  count      = var.vpc_cni_enable ? 1 : 0
  role       = aws_iam_role.vpc_cni_role[count.index].name
  policy_arn = aws_iam_policy.vpc_cni_policy[count.index].arn
}


resource "aws_iam_policy" "vpc_cni_policy" {
  count       = var.vpc_cni_enable ? 1 : 0
  name        = "AmazonEKS_CNI_Policy_terraform"
  description = "Policy to work with autoscale"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AmazonEKSCNIPolicy",
            "Effect": "Allow",
            "Action": [
                "ec2:AssignPrivateIpAddresses",
                "ec2:AttachNetworkInterface",
                "ec2:CreateNetworkInterface",
                "ec2:DeleteNetworkInterface",
                "ec2:DescribeInstances",
                "ec2:DescribeTags",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DescribeInstanceTypes",
                "ec2:DescribeSubnets",
                "ec2:DetachNetworkInterface",
                "ec2:ModifyNetworkInterfaceAttribute",
                "ec2:UnassignPrivateIpAddresses"
            ],
            "Resource": "*"
        },
        {
            "Sid": "AmazonEKSCNIPolicyENITag",
            "Effect": "Allow",
            "Action": [
                "ec2:CreateTags"
            ],
            "Resource": [
                "arn:aws:ec2:*:*:network-interface/*"
            ]
        }
    ]
}
EOF
}