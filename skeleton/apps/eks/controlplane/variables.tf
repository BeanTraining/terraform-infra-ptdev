variable "vpc_id" {
  description = "VPC ID of the EKS cluster"

  type = string
}

variable "subnet_ids" {
  description = "Subnet IDs of the EKS cluster"

  type = list(string)
}

variable "additional_tags" {
  description = "Additional tags for resources"

  default = {}
  type    = map(string)
}

variable "kubernetes_version" {
  description = "Version of Kubernetes that will be deployed on top of EKS"

  default = "1.15"
  type    = string
}

variable "eks_ingress_443_cidrs" {
  description = "Which CIDRs are allowed for reaching EKS API port"

  default = []
  type    = list(string)
}

variable "env_vpn_subnet_cidrs" {
  description = "CIDRs from VPN VPC/Subnets - communication between AWS accounts"

  default = ["10.16.0.0/15"] # dev/stg/prod SG only
  type    = list(string)
}

variable "env_vpn_client_cidrs" {
  description = "CIDRs that allows communication from VPN clients"

  default = [
    "172.16.0.0/13",
  ]
  type = list(string)
}

# EKS CLUSTER TAGS
variable "application" {
  description = "Workload running on the EKS cluster"

  default = "apps"
  type    = string
}

variable "bounded_context" {
  description = "Bounded context of the EKS cluster"

  default = "runtime"
  type    = string
}

variable "cost_center" {
  description = "Cost center of the EKS cluster"

  default = "backend"
  type    = string
}

variable "data_class" {
  description = "Data class of the EKS cluster"

  default = "restricted"
  type    = string
}

variable "environment" {
  description = "Name of the environment"

  type = string
}

variable "owner" {
  description = "Name of the team responsible for these resources"

  default = "application-foundation"
  type    = string
}

variable "mox_site" {
  description = "site of the EKS cluster"

  default = "secondary"
  type    = string
}
