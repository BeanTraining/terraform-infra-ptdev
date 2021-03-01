
locals {
   shared_environment_variables = { 
       AWS_REGION = "ap-southeast-1",
   }
}
variable "aws_access_key_id" {
   type = string
}
variable "aws_secret_access_key" {
   type = string
}
variable "aws_account_ids" {
   type = map(string)
}

resource "tfe_variable" "bean-environment" {
  # We'll need one tfe_variable instance for each
  # combination of workspace and environment variable,
  # so this one has a more complicated for_each expression.
  for_each = {
    for pair in setproduct(var.workspaces, keys(local.shared_environment_variables)) : "${pair[0].environment}-${pair[0].name}/${pair[1]}" => {
      workspace_name = "${pair[0].environment}-${pair[0].name}"
      workspace_id   = tfe_workspace.bean["${pair[0].environment}-${pair[0].name}"].id
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

  workspace_id = tfe_workspace.bean["${var.workspaces[count.index].environment}-${var.workspaces[count.index].name}"].id

  category  = "env"
  key       = "AWS_ACCESS_KEY_ID"
  value     = var.aws_access_key_id
  sensitive = true
}
   
resource "tfe_variable" "bean-environment-aws_secret_access_key" {
  count = length(var.workspaces)

  workspace_id = tfe_workspace.bean["${var.workspaces[count.index].environment}-${var.workspaces[count.index].name}"].id

  category  = "env"
  key       = "AWS_SECRET_ACCESS_KEY"
  value     = var.aws_secret_access_key
  sensitive = true
}

resource "tfe_variable" "bean-environment-aws_account_ids" {
  count = length(var.workspaces)

  workspace_id = tfe_workspace.bean["${var.workspaces[count.index].environment}-${var.workspaces[count.index].name}"].id

  category  = "terraform"
  key       = "aws_account_ids"
  value     = var.aws_account_ids
  sensitive = true
}

   