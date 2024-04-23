# configure TFE provider
provider "tfe" {
  hostname = "app.staging.terraform.io"
}

# create an organization
resource "tfe_organization" "provider_tf_organization" {
  name  = "provider-tf-organization"
  email = "yingying@hashicorp.com"
}

# create a project
resource "tfe_project" "provider_tf_project" {
  organization = tfe_organization.provider_tf_organization.name
  name = "provider-tf-project"
}

# invite user maddy to the org
resource "tfe_organization_membership" "maddy" {
  organization  = tfe_organization.provider_tf_organization.name
  email = "maddy.hodges@hashicorp.com"
}

# create a team in the org
resource "tfe_team" "provider_tf_team" {
  organization = tfe_organization.provider_tf_organization.name
  name         = "provider-tf-team"
}

# add user maddy to the team
resource "tfe_team_organization_member" "maddy" {
  team_id = tfe_team.provider_tf_team.id
  organization_membership_id = tfe_organization_membership.maddy.id
}