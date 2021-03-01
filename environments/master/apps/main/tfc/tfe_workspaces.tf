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
      base_directory = "/environments/master"
      app_type = "apps"
      app_category = "main"
      app_name = "vpc"
      trigger_prefixes = []
      }
     ]
}

variable "environment" {
   type = string
   default = "dev-sg"
   }

resource "tfe_oauth_client" "bean-github" {
  organization     = "BeanTraining"
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_oauth_token
  service_provider = "github"
}

resource "tfe_workspace" "bean" {
  for_each = {for ws in var.workspaces:  "${var.environment}-${ws.app_type}-${ws.app_category}-${ws.app_name}" => ws}
  name                = "${var.environment}-${each.value.app_type}-${each.value.app_category}-${each.value.app_name}"
  organization        = "BeanTraining"
  speculative_enabled = false
  working_directory   = "${each.value.base_directory}-${each.value.app_type}-${each.value.app_category}-${each.value.app_name}"
  trigger_prefixes    = concat(each.value.trigger_prefixes,
     [
        "${each.value.base_directory}-${each.value.app_type}-${each.value.app_category}-${each.value.app_name}",
        "/environments/${var.environment}/apps/main/tfc/releases"
     ]
     )
  vcs_repo {
    identifier       = "BeanTraining/terraform-infra"
    branch           = var.environment
    oauth_token_id   = tfe_oauth_client.bean-github.oauth_token_id
    }
  auto_apply         = var.environment == "master" ? false : true
}


