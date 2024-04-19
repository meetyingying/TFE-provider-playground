provider "tfe" {
  version  = "~> 0.53.0"
  token = "0sA4h4baEYu4oQ.atlasv1.Iz2uXqyE5NuI1f47c1EgUpjvryAtGAOzF83EA9vZeHrTdaEHQgXCHdmYM1zzrTC4L18"
}

resource "tfe_team" "test" {
  name         = "test team"
  organization = "TFE-provider-playground"
}