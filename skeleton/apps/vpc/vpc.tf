module "vpc" {
  source = "../../../modules/aws-vpc"
  app_name               = var.app_name
  environment            = var.environment
  cidr_block             = var.cidr_block
}
