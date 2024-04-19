terraform {
  cloud {
    hostname = "app.staging.terraform.io"
    organization = "YingYing-sandbox"

    workspaces {
      name = "TFE-provider-playground"
    }
  }
}