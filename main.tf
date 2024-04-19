terraform {
  cloud {
    hostname = "app.staging.terraform.io"
    organization = "YingYing-sandbox"

    workspaces {
      name = "TFE-provider-playground"
    }
  }

  required_providers {
    tfe = {
      version = "~> 0.53.0"
    }
  }
}

resource "tfe_organization" "a-module-producer" {
  name  = "TFE-provider-configured-org-YY"
  email = "yingying@hashicorp.com"
}