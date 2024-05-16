# configure TFE provider
provider "tfe" {
  hostname = "app.staging.terraform.io"
}

# reference unified org in TFE provider
data "tfe_organization" "TFC_Unification_Test_Org_2" {
  name = data.hcp_organization.TFC_Unification_Test_Org_2
}

# reference unified project in TFE provider
data "tfe_project" "provider_hcp_project" {
  name = hcp_project.provider_hcp_project.name
  organization = data.tfe_organization.TFC_Unification_Test_Org_2.name
}

# reference unified group in TFE provider
data "tfe_team" "provider_hcp_group" {
  name = hcp_group.provider_hcp_group.display_name
  organization = data.tfe_organization.TFC_Unification_Test_Org_2.name
}

# assign a unified group admin role to a unified project
resource "tfe_team_project_access" "provider_hcp_group_project_access" {
  access       = "admin"
  team_id      = data.tfe_team.provider_hcp_group.id
  project_id   = data.tfe_project.provider_hcp_project.id
}