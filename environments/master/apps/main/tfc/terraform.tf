resource "tfe_organization" "bean-training" {
  name  = "BeanTraining"
  email = "peterbean410@gmail.com"
}

resource "tfe_agent_pool" "bean-agent-pool" {
  name         = "bean-agent-pool"
  organization = tfe_organization.bean-training.id
}

resource "tfe_workspace" "sg-dev-main-apps-vpc" {
  name           = "sg-dev-main-apps-vpc"
  organization   = tfe_organization.bean-training.id
  agent_pool_id  = tfe_organization.bean-agent-pool.id
  execution_mode = "agent"
}
