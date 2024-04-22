// Configure TFE provider
provider "tfe" {}

resource tfe_team "example_tf_team" {
  name         = "example-tf-team"
  organization = "TFE-provider-playground"
}

// Configure HCP provider
provider "hcp" {}

resource hcp_group "example_hcp_team" {
  display_name = "example-hcp-group"
  description  = "HCP group created with HCP provider"
}