variable "app_name" {
  description = "Name of the application"
}

variable "cidr_block" {
  description = "Main VPC CIDR block"
}

variable "enable_private_dns" {
  description = "Enable VPC private DNS"
  default     = false
}

variable "environment" {
  description = "Name of the environment"
}

variable "additional_cidr_blocks" {
  description = "List of additional VPC CIDR blocks"
  default     = []
}

variable "domain_name" {
  description = "Custom domain name"
  default     = ""
}

variable "domain_name_servers" {
  description = "Custom DNS servers"

  default = [
    "AmazonProvidedDNS",
  ]
}

variable "aws_region" {
  description = "AWS region in which flow logs will be stored. Used for creating default domain name"
}

variable "aws_account_id" {
  description = "AWS account ID in which flow logs will be stored"
}

variable "tags" {
  description = "Map of tags for VPC"

  default = {
    "core.surname" = "UPDATE_TAGS"
  }
  type = map(string)
}

variable "iam_tags" {
  description = "Map of tags for IAM Resources"

  default = {
    "core.surname" = "UPDATE_TAGS"
  }
  type = map(string)
}
