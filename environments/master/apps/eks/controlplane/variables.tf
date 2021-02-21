variable "aws_region" {
  description = "AWS region"

  type = string
}

variable "environment" {
  description = "Name of environment"

  type = string
}

variable "environment_short" {
  description = "Short version of environment without site or region"

  type = string
}

variable "application" {
  description = "Workload running on the EKS cluster"

  type = string
}

# To be migrated from rancher module
variable "subnet_ids" {
  description = "APPS subnet ids"

  type = list(string)
}

variable "secondary_aws_region" {
  description = "Secondary AWS region"

  type = string
}

variable "secondary_aws_account_ids" {
  description = "List of aws accounts ids for environment"

  type = map(string)
}

variable "env_vpn_cidr_blocks" {
  description = "CIDRs from VPN VPC/Subnets - communication between AWS accounts"

  type = list(string)
}

variable "spinnaker_cidr_blocks" {
  description = "Spinnaker CIDRs from crossenv - enable access to EKS/K8S API"

  type = list(string)
}

variable "vault_cidr_blocks" {
  description = "Vault CIDRs from shared - enable access from vault to eks "

  type = list(string)
}

variable "tfc_cidr_blocks" {
  description = "tfe CIDRs from crossenv - enable access from tfe to eks "

  type = list(string)
}

variable "owner" {
  description = "Name of the team responsible for these resources"

  default = "application-foundation"
  type    = string
}

variable "bean_site" {
  description = "Mox site - primary or secondary"

  type = string
}
