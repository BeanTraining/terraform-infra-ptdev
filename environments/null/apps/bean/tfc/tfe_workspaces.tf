provider "tfe" {
  hostname = "app.terraform.io" # Terraform Cloud
  token = var.tfe_token
}

data "tfe_workspace" "bean-tfc" {
  name         = "${var.environment}-terraform-cloud"
  organization = "BeanTraining"
}

variable "notification_endpoint" {
  type = string
  default = "https://bq9qinvfld.execute-api.us-west-2.amazonaws.com/test?"
 }
variable "tfe_token" {
  type = string
}
variable "api_key" {
  type = string
  default = "123456789"
}

variable "github_oauth_token" {
  type = string
}

variable "workspaces" {
  type = list(object({
    base_directory   = string
    app_type         = string
    app_category     = string
    app_name         = string
    auto_apply       = bool
    depends_on       = string
    trigger_prefixes = list(string)
  }))
  default = [
    {
      base_directory   = "/environments/null"
      app_type         = "apps"
      app_category     = "main"
      app_name         = "vpc"
      auto_apply       = true
      depends_on       = ""
      trigger_prefixes = []
    },
    {
      base_directory   = "/environments/null"
      app_type         = "apps"
      app_category     = "main"
      app_name         = "vpc2"
      auto_apply       = true
      depends_on       = "apps-main-vpc"
      trigger_prefixes = []
    }
  ]
}

variable "environment" {
  type    = string
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
  for_each            = { for ws in var.workspaces : "${var.environment}-${ws.app_type}-${ws.app_category}-${ws.app_name}" => ws }
  name                = "${var.environment}-${each.value.app_type}-${each.value.app_category}-${each.value.app_name}"
  organization        = "BeanTraining"
  speculative_enabled = true
  queue_all_runs      = true
  working_directory   = "/environments/null"
  trigger_prefixes = concat(each.value.trigger_prefixes,
    [
      "/environments/null",
      "${each.value.base_directory}/apps/main/tfc/releases"
    ]
  )
  vcs_repo {
    identifier     = "BeanTraining/terraform-infra"
    branch         = var.environment
    oauth_token_id = tfe_oauth_client.bean-github.oauth_token_id
  }
  auto_apply = each.value.auto_apply
}

resource "tfe_run_trigger" "bean" {
  for_each      = { for ws in var.workspaces : "${var.environment}-${ws.app_type}-${ws.app_category}-${ws.app_name}" => ws }
  workspace_id  = tfe_workspace.bean["${var.environment}-${each.value.app_type}-${each.value.app_category}-${each.value.app_name}"].id
  sourceable_id = each.value.depends_on == "" ? data.tfe_workspace.bean-tfc.id : tfe_workspace.bean["${var.environment}-${each.value.depends_on}"].id
}
  
resource "tfe_notification_configuration" "bean-auto-approver" {
  for_each         = { for ws in var.workspaces : "bean-auto-approver-${var.environment}-${ws.app_type}-${ws.app_category}-${ws.app_name}" => ws }
  name             = "bean-auto-approver-${var.environment}-${each.value.app_type}-${each.value.app_category}-${each.value.app_name}"
  enabled          = true
  destination_type = "generic"
  triggers         = ["run:needs_attention"]
  url              = "${var.notification_endpoint}"
  token            = var.api_key
  workspace_id     = tfe_workspace.bean["${var.environment}-${each.value.app_type}-${each.value.app_category}-${each.value.app_name}"].id
}

