# configure TFE provider
provider "tfe" {
  hostname = "app.staging.terraform.io"
}

# assign a unified group admin role to a unified project
resource "tfe_team_project_access" "provider_hcp_group_project_access" {
  access       = "admin"
  team_id      = hcp_group.provider_hcp_group.resource_id
  project_id   = hcp_project.provider_hcp_project.resource_id
  depends_on = [ hcp_project.provider_hcp_project ]
}