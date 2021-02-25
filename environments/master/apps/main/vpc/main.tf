module "skeleton" {
  source                 = "../../../../../skeleton/apps/vpc"
  app_name               = var.app_name
  environment            = var.environment
  cidr_block             = var.cidr_block
  bounded_context        = var.bounded_context
}
