locals {
  outputs = module.skeleton
}

output "skeleton" {
  value = local.outputs
}
