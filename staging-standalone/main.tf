// Configure TFE provider
provider "tfe" {
  hostname = "app.staging.terraform.io"
}

resource "tfe_team" "provider_tf_team" {
  name         = "provider-tf-team"
  organization = "YingYing-sandbox"
}

// Configure HCP provider
provider "hcp" {}

resource "hcp_group" "provider_hcp_team" {
  display_name = "provider-hcp-group"
  description  = "HCP group created with HCP provider"
}