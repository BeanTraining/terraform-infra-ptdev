resource "tfe_agent_pool" "bean-agent-pool" {
  name         = "bean-agent-pool"
  organization = "BeanTraining"
}

resource "tfe_workspace" "sg-dev-main-apps-vpc" {
  name           = "sg-dev-main-apps-vpc"
  organization   = "BeanTraining"
  agent_pool_id  = tfe_agent_pool.bean-agent-pool.id
  execution_mode = "agent"
}
