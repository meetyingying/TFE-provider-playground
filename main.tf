provider "tfe" {}

resource "tfe_team" "example_team" {
  name         = "example-team"
  organization = "TFE-provider-playground"
}