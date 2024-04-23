# configure HCP provider
provider "hcp" {}

# create a new group
resource "hcp_group" "provider_hcp_group" {
  display_name = "provider-hcp-group"
  description  = "HCP group created with HCP provider"
}

# create a couple service principals
resource "hcp_service_principal" "provider_service_principal_1" {
  name = "provider-service-principal-1"
}
resource "hcp_service_principal" "provider_service_principal_2" {
  name = "provider-service-principal-2"
}

# add members to the group
resource "hcp_group_members" "provider_hcp_group_members" {
  group = hcp_group.provider_hcp_group.resource_name
  members = [
    hcp_service_principal.provider_service_principal_1.id,
    hcp_service_principal.provider_service_principal_2.id,
  ]
}