# configure HCP provider
# specify using "default project"
provider "hcp" {
  project_id = "31b0608f-4755-4b81-a239-ae3fe06570be"
}

# create a new project
resource "hcp_project" "provider_hcp_project" {
  name        = "provider-hcp-project"
  description = "Project created with HCP provider"
}

# create service principals in the project
resource "hcp_service_principal" "provider_service_principal_1" {
  name = "provider-service-principal-1"
  parent = hcp_project.provider_hcp_project.resource_name
}
resource "hcp_service_principal" "provider_service_principal_2" {
  name = "provider-service-principal-2"
  parent = hcp_project.provider_hcp_project.resource_name
}

# list existing users for reference
data "hcp_user_principal" "yingying_1" {
  email = "yingying+1@hashicorp.com"
}
data "hcp_user_principal" "yingying_jan23" {
  email = "yingying+jan23@hashicorp.com"
}

# create a new group
resource "hcp_group" "provider_hcp_group" {
  display_name = "provider-hcp-group"
  description  = "HCP group created with HCP provider"
}

# add the users to the group
resource "hcp_group_members" "provider_hcp_group_members" {
  group = hcp_group.provider_hcp_group.resource_name
  members = [
    data.hcp_user_principal.yingying_1.user_id,
    data.hcp_user_principal.yingying_jan23.user_id,
  ]
}