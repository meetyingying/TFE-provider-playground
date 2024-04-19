# Pre-requisites: configure sensitive environmental variables
provider "tfe" {
  version  = "~> 0.53.0"
}

resource "tfe_organization" {
  name  = "TFE-provider-configured-org-YY"
  email = "yingying@hashicorp.com"
}