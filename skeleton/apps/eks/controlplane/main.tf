module "cluster" {
  source = "terraform-aws-eks-cluster"

  cluster_name       = local.cluster_name
  kubernetes_version = var.kubernetes_version
  vpc_id             = var.vpc_id
  subnet_ids         = var.subnet_ids
  ingress_443_cidrs  = local.eks_ingress_443_cidrs

  # Cluster Tags
  environment     = var.environment
  application     = var.application
  cost_center     = var.cost_center
  bounded_context = var.bounded_context
  data_class      = var.data_class
  owner           = var.owner
  site            = var.mox_site
}
