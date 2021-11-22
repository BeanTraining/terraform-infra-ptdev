module "skeleton" {
  source = "git::ssh://git@github.com/BeanTraining/terraform-infra-skeleton.git//apps/vpc?ref=ptdev"
  app_name        = "kops"
#   cidr_block      = var.cidr_block
  bounded_context = "network"
}
