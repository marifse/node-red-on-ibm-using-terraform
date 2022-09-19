
data "ibm_container_cluster_config" "cluster" {
  cluster_name_id = var.cluster_id
  admin           = true
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
