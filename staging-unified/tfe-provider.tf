# configure TFE provider
provider "tfe" {
  hostname = "app.staging.terraform.io"
}

# reference a unified organization
data "tfe_organization" "TFC_Unification_Test_Org_2" {
  name = hcp_organization.TFC_Unification_Test_Org_2.name
}

# reference a unified group
data "tfe_team" "provider_hcp_group" {
  name         = hcp_project.provider_hcp_project.name
  organization = hcp_organization.TFC_Unification_Test_Org_2.name
}

# reference a unified project
data "tfe_project" "provider_hcp_project" {
  name         = hcp_project.provider_hcp_project.name
  organization = tfe_organization.TFC_Unification_Test_Org_2.name
}

# reference a unified project
resource "tfe_team_project_access" "provider_hcp_group_project_access" {
  access       = "admin"
  team_id      = hcp_group.provider_hcp_group.resource_id
  project_id   = hcp_project.provider_hcp_project.resource_id
}