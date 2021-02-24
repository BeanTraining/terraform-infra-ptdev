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
      "main-apps-vpc"
   ] 
}

variable "branches" {
   type = list(string)
   default = ["dev"]
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
  for_each            = toset(var.workspaces)
  name                = join("-",["sg","dev",each.key])
  organization        = "BeanTraining"
  speculative_enabled = false
  working_directory   = "/environments/master/apps/main/vpc"
  trigger_prefixes    = [
     "/environments/master/apps/main/vpc",
     "/environments/master/apps/main/tfc/releases"
     ]
  vcs_repo {
    identifier       = "BeanTraining/terraform-infra"
    branch           = "dev"
    oauth_token_id   = tfe_oauth_client.bean-github.oauth_token_id
    }
  auto_apply         = true
}

  for_each = {
    for pair in setproduct(var.workspaces, keys(local.shared_environment_variables)) : "${pair[0]}/${pair[1]}" => {
      workspace_name = pair[0]
      workspace_id   = tfe_workspace.bean[pair[0]].id
      name           = pair[1]
      value          = local.shared_environment_variables[pair[1]]
    }
  }

  workspace_id = each.value.workspace_id


