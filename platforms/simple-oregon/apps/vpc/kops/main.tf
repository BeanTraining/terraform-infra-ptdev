module "skeleton" {
  source = "git::ssh://git@github.com/BeanTraining/terraform-infra-skeleton.git//apps/vpc?ref=ptdev"
  vpc_name        = "${var.environment}-${var.platform}-${var.app_type}-${var.app_category}-${var.app_name}"
  # cidr_block      = var.cidr_block
  bounded_context = "network"
}
