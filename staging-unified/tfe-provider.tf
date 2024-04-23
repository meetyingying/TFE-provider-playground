# configure TFE provider
provider "tfe" {
  hostname = "app.staging.terraform.io"
}

# reference an organization
data "tfe_organization" "TFC_Unification_Test_Org_2" {
  name = "TFC-Unification-Test-Org-2"
}