data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["KopsBastionUbuntu20Focal*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["249617153445"] # SharedBean ???
}

data "aws_ami" "amazon2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20211103.1-arm64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # Canonical
}

data "aws_ami" "nat_ami_amazon2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["NatInstanceBuiltManually-amazon2-arm-v1"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["606500562958"] # Canonical
}

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = module.skeleton.vpc_public_subnet_ids[0]
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  
  key_name      = "shared_deployer_peterbean"

  tags = {
    Name = "Bastion"
  }
}

resource "aws_instance" "private" {
  ami           = data.aws_ami.amazon2.id
  instance_type = "t4g.micro"
  subnet_id     = module.skeleton.vpc_private_subnet_ids[0]
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  key_name      = "shared_deployer_peterbean"
  
  tags = {
    Name = "PrivateInstance"
  }
}

resource "aws_instance" "nat" {
  source_dest_check = false
  ami           = data.aws_ami.nat_ami_amazon2.id
  instance_type = "t4g.micro"

  network_interface {
    network_interface_id = aws_network_interface.nat.id
    device_index         = 0
  }

  vpc_security_group_ids = [aws_security_group.allow_all.id]
  
  key_name      = "shared_deployer_peterbean"

  tags = {
    Name = "NAT managed by tf"
  }
}

# resource "aws_instance" "foo" {
#   ami           = "ami-005e54dee72cc1d00" # us-west-2
#   instance_type = "t2.micro"

#   network_interface {
#     network_interface_id = aws_network_interface.foo.id
#     device_index         = 0
#   }

#   credit_specification {
#     cpu_credits = "unlimited"
#   }
# }


# resource "aws_route" "nat" {
#   route_table_id              = module.skeleton.vpc_private_route_table_ids[0]
#   destination_cidr_block    = "0.0.0.0/0"
#   network_interface_id      = aws_instance.nat.primary_network_interface_id
# }


resource "aws_network_interface" "nat" {
  subnet_id       = module.skeleton.vpc_public_subnet_ids[0]
  private_ips     = ["10.0.4.1"]
  security_groups = [aws_security_group.allow_all.id]
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow ALL inbound traffic"
  vpc_id      = module.skeleton.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_all"
  }
}
