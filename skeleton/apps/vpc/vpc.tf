locals {
  tags = merge(
    module.bean_tags.vpc_mandatory,
    var.additional_tags,
  )
}

module "vpc" {
  source = "../../../modules/aws-vpc"

  app_name               = var.app_name
  cidr_block             = var.cidr_block
  additional_cidr_blocks = var.additional_cidr_blocks
  environment            = var.environment
  enable_private_dns     = var.enable_private_dns
  aws_region             = var.aws_region
  aws_account_id         = var.aws_account_id
  tags                   = local.tags
}
