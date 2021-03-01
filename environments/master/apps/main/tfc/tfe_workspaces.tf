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
   type = list(object({
      name = string
      working_directory = string
      trigger_prefixes = list(string)
      environment = string
      }))
   default = [
      {
      name = "apps-main-vpc"
      working_directory = "/environments/master/apps/main/vpc"
      environment = "dev-sg"
      trigger_prefixes = []
      }
     ]
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
  for_each = {for ws in var.workspaces:  "${ws.environment}-${ws.name}" => ws}
  name                = "${each.value.environment}-${each.value.name}"
  organization        = "BeanTraining"
  speculative_enabled = false
  working_directory   = each.value.working_directory
  trigger_prefixes    = concat(each.value.trigger_prefixes,
     [
     each.value.working_directory,
     "/environments/${each.value.environment}/apps/main/tfc/releases"
     ]
     )
  vcs_repo {
    identifier       = "BeanTraining/terraform-infra"
    branch           = each.value.environment
    oauth_token_id   = tfe_oauth_client.bean-github.oauth_token_id
    }
  auto_apply         = each.value.environment == "master" ? false : true
}


