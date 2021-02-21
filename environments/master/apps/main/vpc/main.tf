data "aws_caller_identity" "current" {}

module "skeleton" {
  source                 = "../../../../../skeleton/apps/vpc"
  additional_cidr_blocks = var.additional_vpc_cidr_blocks
  app_name               = var.app_name
  aws_account_id         = data.aws_caller_identity.current.account_id
  aws_region             = var.secondary_aws_region
  cidr_block             = var.vpc_cidr_block
  enable_private_dns     = var.vpc_enable_private_dns
  environment            = var.environment
  environment_short      = var.environment_short
  aws_account_name       = var.secondary_aws_account_names.apps
  owner                  = var.owner
  site                   = var.bean_site
  bounded_context        = var.bounded_context
  data_class             = var.data_class_names["internal"]
  additional_tags        = var.tf_tags
}

resource "null_resource" "apply_outputs" {}
