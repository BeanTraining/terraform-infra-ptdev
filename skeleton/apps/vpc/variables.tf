variable "app_name" {}
variable "cidr_block" {}

variable "additional_cidr_blocks" {
  default = []
}

variable "enable_private_dns" {
  default = false
}

variable "environment" {}
variable "aws_region" {}
variable "aws_account_id" {}

# tags related

variable "aws_account_name" {
  description = "AWS account name"

  type = string
}

variable "environment_short" {
  description = "Environment name without region suffix"

  type = string
}

variable "site" {
  description = "Bean site - primary or secondary"

  type = string
}

variable "owner" {
  description = "Name of the team responsible for these resources"

  type = string
}

variable "bounded_context" {
  description = "Bounded context"

  type = string
}

variable "data_class" {
  description = "Data Class tag"

  type = string
}

variable "additional_tags" {
  description = "Additional tags that you would like to pass to resource"

  default = {}
}

# /tags related
