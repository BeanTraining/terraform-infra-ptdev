# Please keep in alphabetical order

output "acm" {
  description = "ACM tags required by Bean's resource classification"

  value = local.acm
}

output "asg" {
  description = "ASG tags required by Bean's resource classification"

  value = local.asg
}

output "asm" {
  description = "asm tags"

  value = local.asm
}

output "dx" {
  description = "DX tags"

  value = local.dx
}

output "dx_mandatory" {
  description = "DX mandatory tags"

  value = local.dx_mandatory
}

output "dx_optional" {
  description = "DX optional tags"

  value = local.dx_optional
}

output "dynamodb" {
  description = "dynamodb tags"

  value = local.dynamodb
}

output "ec2" {
  description = "EC2 tags required by Bean's resource classification"

  value = local.ec2
}

output "elb" {
  description = "ELB tags required by Bean's resource classification"

  value = local.elb
}

output "eks" {
  description = "AWS EKS tags required by Bean's resource classification"

  value = local.eks
}

output "elastic_beanstalk" {
  description = "AWS Elastic Beanstalk Application tags required by Bean's resource classification"

  value = local.elastic_beanstalk
}

output "endpoint_mandatory" {
  description = "AWS VPC Endpoint mandatory tags by Bean's resource classification"

  value = local.endpoint_mandatory
}

output "endpoint_optional" {
  description = "AWS VPC Endpoint optional tags by Bean's resource classification"

  value = local.endpoint_optional
}

output "endpoint" {
  description = "AWS VPC Endpoint by Bean's resource classification"

  value = local.endpoint
}

output "iam" {
  description = "IAM tags"

  value = local.iam
}

output "iam_mandatory" {
  description = "IAM mandatory tags"

  value = local.iam_mandatory
}

output "iam_optional" {
  description = "IAM optional tags"

  value = local.iam_optional
}

output "igw" {
  description = "IGW tags"

  value = local.igw
}

output "igw_mandatory" {
  description = "IGW mandatory tags"

  value = local.igw_mandatory
}

output "igw_optional" {
  description = "IGW optional tags"

  value = local.igw_optional
}

output "kinesis" {
  description = "AWS Kinesis tags required by Bean's resource classification"

  value = local.kinesis
}

output "kms" {
  description = "kms tags"

  value = local.kms
}

output "lambda" {
  description = "AWS Lambda tags required by Bean's resource classification"

  value = local.lambda
}

output "rds" {
  description = "RDS tags required by Bean's resource classification"

  value = local.rds
}

output "rt_mandatory" {
  description = "AWS Route Table mandatory tags by Bean's resource classification"

  value = local.rt_mandatory
}

output "rt_optional" {
  description = "AWS Route Table optional tags by Bean's resource classification"

  value = local.rt_optional
}

output "rt" {
  description = "AWS Route Table by Bean's resource classification"

  value = local.rt
}

output "s3" {
  description = "AWS S3 tags required by Bean's resource classification"

  value = local.s3
}

output "sqs" {
  description = "AWS SQS tags required by Bean's resource classification"

  value = local.sqs
}

output "ssm_maintenance_window" {
  description = "SSM maintenance window tags"

  value = local.ssm_maintenance_window
}

output "subnet" {
  description = "AWS VPC Subnet tags required by Bean's resource classification"

  value = local.subnet
}

output "subnet_mandatory" {
  description = "Mandatory AWS VPC Subnet tags required by Bean's resource classification"

  value = local.subnet_mandatory
}

output "subnet_optional" {
  description = "Optional AWS VPC Subnet tags required by Bean's resource classification"

  value = local.subnet_optional
}

output "tgw" {
  description = "TGW tags"

  value = local.tgw
}

output "tgw_mandatory" {
  description = "TGW mandatory tags"

  value = local.tgw_mandatory
}

output "tgw_optional" {
  description = "TGW optional tags"

  value = local.tgw_optional
}

output "tgw_attachment" {
  description = "TGW Attachment tags"

  value = local.tgw_attachment
}

output "tgw_attachment_mandatory" {
  description = "TGW Attachment mandatory tags"

  value = local.tgw_attachment_mandatory
}

output "tgw_attachment_optional" {
  description = "TGW Attachment optional tags"

  value = local.tgw_attachment_optional
}

output "vpc" {
  description = "VPC tags"

  value = local.vpc
}

output "vpc_mandatory" {
  description = "VPC mandatory tags"

  value = local.vpc_mandatory
}

output "vpc_optional" {
  description = "VPC optional tags"

  value = local.vpc_optional
}

output "vpn" {
  description = "VPN tags"

  value = local.vpn
}

output "vpn_mandatory" {
  description = "VPN mandatory tags"

  value = local.vpn_mandatory
}

output "vpn_optional" {
  description = "VPN optional tags"

  value = local.vpn_optional
}
