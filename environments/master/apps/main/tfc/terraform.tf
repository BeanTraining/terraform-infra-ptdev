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

resource "tfe_workspace" "sg-dev-main-apps-vpc" {
  name                = "sg-dev-main-apps-vpc"
  organization        = "BeanTraining"
  speculative_enabled = false
  working_directory   = "/environments/master/apps/main/vpc"
  vcs_repo {
    identifier  = "BeanTraining/terraform-infra"
    branch      = "dev"
    }
}
