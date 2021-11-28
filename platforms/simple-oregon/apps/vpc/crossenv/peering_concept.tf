module "peering" {
  source      = "git::ssh://git@github.com/BeanTraining/terraform-infra-skeleton.git//transit/vpc_peering?ref=ptdev"
  peer_vpc_id = "vpc-059826eaff83ba2e6"
  vpc_id      = module.skeleton.vpc_id
  providers = {
    aws.peer = aws
  }
}