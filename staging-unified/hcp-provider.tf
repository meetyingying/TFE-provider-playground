# configure HCP provider
# specify using "default project"
provider "hcp" {
  project_id = "31b0608f-4755-4b81-a239-ae3fe06570be"
}

# reference the HCP org the service principal created in
data "hcp_organization" "TFC_Unification_Test_Org_2" {
}

# create a new project
resource "hcp_project" "provider_hcp_project" {
  name        = "provider-hcp-project"
  description = "Project created with HCP provider"
}

# create service principals in the project
resource "hcp_service_principal" "provider_sp_1" {
  name = "provider-sp-1"
  parent = hcp_project.provider_hcp_project.resource_name
}
resource "hcp_service_principal" "provider_sp_2" {
  name = "provider-sp-2"
  parent = hcp_project.provider_hcp_project.resource_name
}

# list existing users for reference
data "hcp_user_principal" "joey" {
  email = "joey.lei@hashicorp.com"
}
data "hcp_user_principal" "maddy" {
  email = "maddy.hodges@hashicorp.com"
}
data "hcp_user_principal" "yingying" {
  email = "yingying@hashicorp.com"
}

# create a new group
resource "hcp_group" "provider_hcp_group" {
  display_name = "provider-hcp-group"
  description  = "HCP group created with HCP provider"
}
resource "hcp_group" "provider_hcp_group_2" {
  display_name = "provider-hcp-group-2"
  description  = "Another HCP group created with HCP provider"
}

# add the users to the group
resource "hcp_group_members" "provider_hcp_group_members" {
  group = hcp_group.provider_hcp_group.resource_name
  members = [
    data.hcp_user_principal.joey.user_id,
    data.hcp_user_principal.maddy.user_id,
    data.hcp_user_principal.yingying.user_id,
  ]
}

# assign provider_sp_1 contributor role to provider_hcp_project
resource "hcp_project_iam_binding" "provider_project_sp_1_iam" {
  project_id   = hcp_project.provider_hcp_project.resource_id
  principal_id = hcp_service_principal.provider_sp_1.resource_id
  role         = "roles/contributor"
}

# assign provider_hcp_group contributor role to provider_hcp_project
# Terraform apply success, but did not add this group to the project, or change roles
resource "hcp_project_iam_binding" "provider_project_group_iam" {
  project_id   = hcp_project.provider_hcp_project.resource_id
  principal_id = hcp_group.provider_hcp_group.resource_id
  role         = "roles/contributor"
}