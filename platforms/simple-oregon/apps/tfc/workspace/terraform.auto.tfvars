
workspaces = [
  {
    app_type         = "apps"
    app_category     = "vpc"
    app_name         = "kops"
    auto_apply       = true
    depends_on       = ""
    execution_mode   = "remote"
    trigger_prefixes = []
    is_vcs_connected = true
  },
  {
    app_type         = "apps"
    app_category     = "vpc"
    app_name         = "crossenv"
    auto_apply       = true
    depends_on       = ""
    execution_mode   = "remote"
    trigger_prefixes = []
    is_vcs_connected = true
  }
]
platform = "simple-oregon"
