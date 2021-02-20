output "bean_eks_cluster_id" {
  description = "ID of the EKS cluster"

  value = module.cluster.bean_eks_cluster_id
}
output "bean_eks_cluster_security_group_id" {
  description = "ID of the EKS cluster security group"

  value = module.cluster.bean_security_group_id
}
output "bean_eks_cluster_endpoint" {
  description = "Endpoint of the EKS cluster"

  value = module.cluster.bean_eks_cluster_endpoint
}
output "bean_eks_cluster_certificate_authority" {
  description = "CA of the EKS cluster"

  value     = module.cluster.bean_eks_cluster_certificate_authority
  sensitive = true
}
output "bean_eks_cluster_iam_openid_connect_provider_arn" {
  description = "OpenId Connect provider ARN for EKS Cluster"

  value = module.cluster.bean_iam_openid_connect_provider_arn
}
output "bean_eks_cluster_iam_openid_connect_provider_url" {
  description = "OpenId Connect provider URL for EKS Cluster"

  value = module.cluster.bean_iam_openid_connect_provider_url
}
output "bean_eks_cluster_iam_openid_connect_provider_thumbprint_list" {
  description = "OpenId Connect provider thumbprint list for EKS Cluster"

  value = module.cluster.bean_iam_openid_connect_provider_thumbprint_list
}
output "bean_eks_cluster_kubernetes_version" {
  description = "Kubernetes version of this EKS cluster"

  value = var.kubernetes_version
}
