bounded_context = "network"
app_name        = "crossenv"
app_category    = "vpc"
app_type        = "apps"

cidr_block                 = "172.32.0.0/16"
public_subnet_cidr_blocks  = ["172.32.64.0/24", "172.32.65.0/24", "172.32.66.0/24"]
private_subnet_cidr_blocks = ["172.32.0.0/20", "172.32.16.0/20", "172.32.32.0/20"]
nat_instance_private_ip    = "172.32.64.10"

vpc_peerings = []