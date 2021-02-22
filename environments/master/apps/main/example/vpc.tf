resource "aws_vpc" "main" { 
cidr_block = "10.0.0.0/16" 
instance_tenancy = "default" 
region = "ap-southeast-1"
tags = { 
Name = var.bean_site 
}
}
