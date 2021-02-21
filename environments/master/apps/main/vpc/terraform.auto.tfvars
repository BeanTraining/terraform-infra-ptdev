additional_vpc_cidr_blocks = [
  "10.12.32.0/19",
  "10.12.64.0/19",
]

app_name               = "apps"
vpc_cidr_block         = "10.12.0.0/19"
vpc_enable_private_dns = true

bounded_context = "network"
