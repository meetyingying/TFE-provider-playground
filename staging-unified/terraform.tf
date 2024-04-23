terraform {
  cloud {
    hostname = "app.staging.terraform.io"
    organization = "TFC-Unification-Test-Org-2"

    workspaces {
      name = "TFE-provider-playground"
    }
  }

  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "~> 0.53.0"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = "~> 0.86.0"
    }
  }
  
  required_version = "~> 1.2"
}