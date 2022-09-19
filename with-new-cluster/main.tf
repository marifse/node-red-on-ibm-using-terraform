
data "ibm_container_cluster_config" "cluster" {
  cluster_name_id = var.cluster_id
  admin           = true
}
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

provider "helm" {
  kubernetes {
    host                   = data.ibm_container_cluster_config.cluster.host
    client_certificate     = data.ibm_container_cluster_config.cluster.admin_certificate
    client_key             = data.ibm_container_cluster_config.cluster.admin_key
    cluster_ca_certificate = data.ibm_container_cluster_config.cluster.ca_certificate
  }
}

provider "kubernetes" {
  host                   = data.ibm_container_cluster_config.cluster.host
  client_certificate     = data.ibm_container_cluster_config.cluster.admin_certificate
  client_key             = data.ibm_container_cluster_config.cluster.admin_key
  cluster_ca_certificate = data.ibm_container_cluster_config.cluster.ca_certificate
}

resource "helm_release" "node-red" {
  name       = var.chart_value_name
  repository = "https://schwarzit.github.io/node-red-chart"
  chart      = "node-red"

  values = [
    "${file("node-red-chart-values.yaml")}"
  ]

}

data "kubernetes_service" "node_ip" {
  metadata {
    name = var.chart_value_name
  }
  depends_on = [
    helm_release.node-red
  ]
}

output "Node_Port_Name" {
   value = data.kubernetes_service.node_ip.spec.0.port.0.node_port
}
