# Configure HCP provider
provider "hcp" {}

resource "hcp_group" "provider_hcp_team" {
  display_name = "provider-hcp-group"
  description  = "HCP group created with HCP provider"
}