sed -i 's/master/null/g' tfe_workspaces.tf
sed -i 's/queue_all_runs      = false/queue_all_runs      = true/g' tfe_workspaces.tf
