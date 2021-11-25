module "skeleton" {
  source   = "git::ssh://git@github.com/BeanTraining/terraform-infra-skeleton.git//apps/vpc?ref=ptdev"
  vpc_name = "${var.app_name}-${var.app_category}-${var.app_type}-${var.platform}-${var.environment}"
  # cidr_block      = var.cidr_block
  bounded_context = "network"
}
