data "ibm_resource_group" "group" {
  name = var.resource_group
}
resource "ibm_container_cluster" "cluster" {
  name              = var.cluster_name
  datacenter        = var.datacenter
  default_pool_size = var.default_pool_size
  machine_type      = var.machine_type
  hardware          = var.hardware
  kube_version      = var.kube_version
  #public_vlan_id    = var.public_vlan_num
  #private_vlan_id   = var.private_vlan_num
  resource_group_id = data.ibm_resource_group.group.id
}
