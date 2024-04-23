# configure TFE provider
provider "tfe" {
  hostname = "app.staging.terraform.io"
}

# reference an organization
data "tfe_organization" "TFC_Unification_Test_Org_2" {
  name = "TFC-Unification-Test-Org-2"
}

# create a project in the org
resource "tfe_project" "provider_tf_project" {
  organization = data.tfe_organization.TFC_Unification_Test_Org_2.name
  name = "provider-tf-project"
}

# invite user yingying+standalone to the org
resource "tfe_organization_membership" "yingying_standalone" {
  organization  = data.tfe_organization.TFC_Unification_Test_Org_2.name
  email = "yingying-standalone@hashicorp.com"
}

# create a team in the org
resource "tfe_team" "provider_tf_team" {
  organization = data.tfe_organization.TFC_Unification_Test_Org_2.name
  name         = "provider-tf-team"
}

# add user yingying+standalone to the team
resource "tfe_team_organization_member" "yingying_standalone" {
  team_id = tfe_team.provider_tf_team.id
  organization_membership_id = tfe_organization_membership.yingying_standalone.id
}