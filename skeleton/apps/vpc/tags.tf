module "bean_tags" {
  source = "../../../modules/aws-tags"

  account         = var.aws_account_name
  application     = var.app_name
  cost_center     = var.owner
  environment     = var.environment_short
  owner           = var.owner
  site            = var.site
  bounded_context = var.bounded_context
  data_class      = var.data_class
}
