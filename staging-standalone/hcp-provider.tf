# configure HCP provider
provider "hcp" {
}

# add the organization for reference
data "hcp_organization" "yingying_org" {
}

# create a new group
resource "hcp_group" "provider_hcp_group" {
  display_name = "provider-hcp-group"
  description  = "HCP group created with HCP provider"
}

# create a new project
resource "hcp_project" "provider_hcp_project" {
  name        = "provider-hcp-project"
  description = "Project created with HCP provider"
}

# create a couple service principals in the project
resource "hcp_service_principal" "provider_service_principal_1" {
  name = "provider-service-principal-1"
  parent = data.hcp_organization.yingying_org.resource_name
}
resource "hcp_service_principal" "provider_service_principal_2" {
  name = "provider-service-principal-2"
  parent = data.hcp_organization.yingying_org.resource_name
}

# add the service principals to the group
resource "hcp_group_members" "provider_hcp_group_members" {
  group = hcp_group.provider_hcp_group.resource_name
  members = [
    hcp_service_principal.provider_service_principal_1.resource_id,
    hcp_service_principal.provider_service_principal_2.resource_id,
  ]
}