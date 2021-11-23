data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
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

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = module.skeleton.vpc_public_subnet_ids[0]

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "private" {
  ami           = data.aws_ami.amazon2.id
  instance_type = "t3.micro"
  subnet_id     = module.skeleton.vpc_private_subnet_ids[0]

  tags = {
    Name = "PrivateInstance"
  }
}
