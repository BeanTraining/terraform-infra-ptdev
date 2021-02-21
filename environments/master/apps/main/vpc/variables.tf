variable "additional_vpc_cidr_blocks" {
  type = list(string)
}

variable "app_name" {
  type = string
}

variable "secondary_aws_region" {
  type = string
}

variable "environment" {
  type = string
}

variable "secondary_aws_account_ids" {
  description = "List of aws accounts ids for environment"

  type = map
}

variable "secondary_aws_account_names" {
  description = "List of aws account names for environment"

  type = map
}

variable "vpc_cidr_block" {
  type = string
}

variable "vpc_enable_private_dns" {
  type = bool
}

variable "environment_short" {
  description = "Environment name without region suffix"

  type = string
}

variable "bean_site" {
  description = "Bean site - primary or secondary"

  type = string
}

variable "bounded_context" {
  description = "Bounded context"

  type = string
}

variable "data_class_names" {
  description = "Data Class tag possible names"

  type = map(string)
}

variable "tf_tags" {
  description = "Map of tags to identify terraform code base and workspace"

  type = map(string)
}

variable "owner" {
  description = "Bean Owner value for Core Foundation resources"

  type = string
}
