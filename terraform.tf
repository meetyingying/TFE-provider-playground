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
      source = "hashicorp/tfe"
      version = "~> 0.53.0"
    }
  }
  
  required_version = "~> 1.2"
}