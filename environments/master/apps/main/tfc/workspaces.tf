locals {
   shared_environment_variables = { 
       AWS_REGION = "ap-southeast-1",
   }
}

terraform {
   required_providers {
     tfe = {
       version = "~> 0.24.0"
     }
   }
 }

provider "tfe" {
   hostname = "app.terraform.io" # Terraform Cloud
}

variable "github_oauth_token" {
   type = string
}

variable "workspaces" {
   type = list(string)
   default = [
      "sg-dev-main-apps-vpc"
   ] 
}

variable "aws_access_key_id" {
   type = string
}

variable "aws_secret_access_key" {
   type = string
}

data "tfe_workspace" "sg-dev-main-apps-example" {
  name           = "sg-dev-main-apps-example"
  organization   = "BeanTraining"
}

resource "tfe_variable" "example" {
  key          = "bean_site"
  value        = "bean.academy"
  category     = "terraform"
  workspace_id = data.tfe_workspace.sg-dev-main-apps-example.id
  description  = "a useful description"
}

resource "tfe_oauth_client" "bean-github" {
  organization     = "BeanTraining"
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_oauth_token
  service_provider = "github"
}

resource "tfe_workspace" "bean" {
  for_each            = var.workspaces
  name                = each.key
  organization        = "BeanTraining"
  speculative_enabled = false
  working_directory   = "/environments/master/apps/main/vpc"
  vcs_repo {
    identifier       = "BeanTraining/terraform-infra"
    branch           = "dev"
    oauth_token_id   = tfe_oauth_client.bean-github.oauth_token_id
    }
}

resource "tfe_variable" "bean-environment" {
  # We'll need one tfe_variable instance for each
  # combination of workspace and environment variable,
  # so this one has a more complicated for_each expression.
  for_each = {
    for pair in setproduct(var.workspaces, keys(local.shared_environment_variables)) : "${pair[0]}/${pair[1]}" => {
      workspace_name = pair[0]
      workspace_id   = tfe_workspace.bean[pair[0]].id
      name           = pair[1]
      value          = local.shared_environment_variables[pair[1]]
    }
  }

  workspace_id = each.value.workspace_id

  category  = "env"
  key       = each.value.name
  value     = each.value.value
  sensitive = false
}
   
resource "tfe_variable" "bean-environment-aws_access_key_id" {
  count = length(var.workspaces)

  workspace_id = var.workspaces[count.index].workspace_id

  category  = "env"
  key       = "AWS_ACCESS_KEY_ID"
  value     = var.aws_access_key_id
  sensitive = false
}
   
resource "tfe_variable" "bean-environment-aws_secret_access_key" {
  count = length(var.workspaces)

  workspace_id = tfe_workspace.bean[var.workspaces[count.index]].id

  category  = "env"
  key       = "AWS_SECRET_ACCESS_KEY"
  value     = var.aws_secret_access_key
  sensitive = false
}
