locals {
  cluster_name = "${var.environment}-${var.application}"

  eks_ingress_443_cidrs = concat(
    var.eks_ingress_443_cidrs,
    var.env_vpn_subnet_cidrs,
    var.env_vpn_client_cidrs,
  )
}
