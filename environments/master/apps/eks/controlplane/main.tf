module "skeleton" {
  source = "../../../../../skeleton/apps/eks/controlplane"

  application          = var.application
  environment          = var.environment
  vpc_id               = data.terraform_remote_state.vpc.outputs.bean_vpc_id
  subnet_ids           = var.subnet_ids
  env_vpn_subnet_cidrs = var.env_vpn_cidr_blocks
  eks_ingress_443_cidrs = concat(
    var.spinnaker_cidr_blocks,
    var.tfe_cidr_blocks,
    var.vault_cidr_blocks,
  )
  
  owner    = var.owner
  mox_site = var.bean_site
}
