// Configure TFE provider
provider "tfe" {
  hostname = "app.staging.terraform.io"
}
resource "tfe_organization" "provider_tf_organization" {
  name  = "provider-tf-organization"
  email = "yingying@hashicorp.com"
}
resource "tfe_team" "provider_tf_team" {
  name         = "provider-tf-team"
  organization = "YingYing-sandbox"
}

resource "tfe_team_member" "andre" {
  team_id  = tfe_team.provider_tf_team.id
  username = "andre_pereira_hcp"
}

resource "tfe_organization" "provider_tf_organization" {
  name  = "provider-tf-organization"
  email = "yingying@hashicorp.com"
}

// Configure HCP provider
provider "hcp" {}

resource "hcp_group" "provider_hcp_team" {
  display_name = "provider-hcp-group"
  description  = "HCP group created with HCP provider"
}