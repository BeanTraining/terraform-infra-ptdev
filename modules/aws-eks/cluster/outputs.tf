output "this_eks_cluster_endpoint" {
  description = "The endpoint for Kubernetes API server"

  value = aws_eks_cluster.this.endpoint
}

output "this_eks_cluster_certificate_authority" {
  description = "Base64 encoded certificate authority data of Kubernetes API server"

  value     = aws_eks_cluster.this.certificate_authority[0].data
  sensitive = true
}

output "this_eks_cluster_id" {
  description = "The name of the cluster. Required for VPC/subnet tagging before EKS creation"

  value = local.cluster_name
}

output "this_security_group_id" {
  description = "The ID of EKS security group"

  value = aws_security_group.this.id
}

output "this_iam_openid_connect_provider_arn" {
  description = "The ARN assigned by AWS for this provider"

  value = aws_iam_openid_connect_provider.this.arn
}

output "this_iam_openid_connect_provider_url" {
  description = "The URL of the identity provider"

  value = aws_iam_openid_connect_provider.this.url
}

output "this_iam_openid_connect_provider_thumbprint_list" {
  description = "A list of server certificate thumbprints for the OpenID Connect (OIDC) identity provider's server certificate(s)"

  value = aws_iam_openid_connect_provider.this.thumbprint_list
}

output "this_aws_iam_role_name" {
  description = "Name of Cluster IAM Role"

  value = aws_iam_role.this.name
}
