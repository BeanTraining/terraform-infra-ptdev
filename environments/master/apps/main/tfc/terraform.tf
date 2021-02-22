data "tfe_workspace" "sg-dev-main-apps-vpc" {
  name           = "sg-dev-main-apps-vpc"
  organization   = "BeanTraining"
}

resource "tfe_variable" "test" {
  key          = "my_key_name"
  value        = "my_value_name"
  category     = "terraform"
  workspace_id = tfe_workspace.sg-dev-main-apps-vpc.id
  description  = "a useful description"
}
