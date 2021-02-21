locals {
  domain_name       = var.domain_name == "" ? "${var.aws_region}.compute.internal" : var.domain_name
  vpc_name          = "${var.tags["core.surname"]}-${var.app_name}-vpc"
  dhcp_options_name = "${var.tags["core.surname"]}-${var.app_name}-dhcp-os"
}

resource "aws_vpc" "bean" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_private_dns
  enable_dns_hostnames = var.enable_private_dns

  tags = merge(
    {
      Name = local.vpc_name,
    },
    var.tags
  )
}

resource "aws_vpc_ipv4_cidr_block_association" "bean" {
  count = length(var.additional_cidr_blocks)

  cidr_block = var.additional_cidr_blocks[count.index]
  vpc_id     = aws_vpc.bean.id
}

resource "aws_vpc_dhcp_options" "bean" {
  domain_name         = local.domain_name
  domain_name_servers = var.domain_name_servers

  tags = merge(
    {
      Name = local.dhcp_options_name,
    },
    var.tags
  )
}

resource "aws_vpc_dhcp_options_association" "bean" {
  dhcp_options_id = aws_vpc_dhcp_options.bean.id
  vpc_id          = aws_vpc.bean.id
}

resource "aws_default_security_group" "bean" {
  vpc_id = aws_vpc.bean.id

  tags = merge(
    {
      Name = local.vpc_name,
    },
    var.tags
  )
}
