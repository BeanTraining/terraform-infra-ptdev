data "tfe_workspace" "sg-dev-main-apps-vpc" {
  name           = "sg-dev-main-apps-vpc"
  organization   = "BeanTraining"
}

provider "tfe" {
  hostname = "app.terraform.io" # Terraform Cloud
}

resource "tfe_variable" "test" {
  key          = "bean_site"
  value        = "bean.academy"
  category     = "terraform"
  workspace_id = data.tfe_workspace.sg-dev-main-apps-vpc.id
  description  = "a useful description"
}
