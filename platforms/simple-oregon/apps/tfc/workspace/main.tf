module "tfe_workspaces" {
  source = "git::ssh://git@github.com/BeanTraining/terraform-infra-skeleton.git//apps/tfe_workspace?ref=ptdev"
  # tfe_workspace_commons.tf
  workspaces  = var.workspaces
  api_key     = var.api_key
  environment = var.environment
  # tfe_variables.tf
  private_key = var.private_key
  platform    = var.platform
  infra_stage = var.infra_stage
  # tfe_variables.tf but only required for child ws
  aws_account_id        = var.aws_account_id
  aws_access_key_id     = var.aws_access_key_id
  aws_secret_access_key = var.aws_secret_access_key
  tfe_token             = var.tfe_token
  github_oauth_token    = var.github_oauth_token
  app_type              = "apps"
}