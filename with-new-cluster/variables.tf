variable "cluster_id" {
  default = "mycluster-free"
}

variable "ibmcloud_api_key" {
  type        = string
  description = "The IAM API Key for IBM Cloud access (https://cloud.ibm.com/iam/apikeys)"
  default = "_kq4OV0JGPLQF_-1G5a26dpvslFmzhg7aQDZ-NywNisb"
  //wE4hgAjJIYxbnLqKf0kwXj0JmP8hsIqE9lDDV3yJr2vP
}

variable "chart_value_name" {
  default = "node-red-v11"
}

variable "resource_group" {
  type        = string
  description = "Resource group name where the toolchain should be created (`ibmcloud resource groups`)"
  default = "Default"
}

variable "cluster_name" {
  type        = string
  description = "Name of new Kubernetes cluster to create"
  default = "nodejs-cloudant"
}

variable "machine_type" {
  default     = "free"
  description = "Name of machine type from `ibmcloud ks flavors --zone <ZONE>`"
}
variable "hardware" {
  default     = "shared"
  description = "The level of hardware isolation for your worker node. Use 'dedicated' to have available physical resources dedicated to you only, or 'shared' to allow physical resources to be shared with other IBM customers. For IBM Cloud Public accounts, the default value is shared. For IBM Cloud Dedicated accounts, dedicated is the only available option."
}

variable "datacenter" {
  type        = string
  description = "Zone from `ibmcloud ks zones --provider classic`"
  default = "dal10"
}

variable "plan" {
  type        = string
  description = "Plan to create resources"
  default = "lite"
}


variable "region" {
  type        = string
  description = "location for cloudantdb"
  default = "us-south"
}


variable "default_pool_size" {
  default     = "1"
  description = "Number of worker nodes for the new Kubernetes cluster"
}

variable "private_vlan_num" {
  type        = string
  description = "Number for private VLAN from `ibmcloud ks vlans --zone <ZONE>`"
  default = "2108609"
}

variable "public_vlan_num" {
  type        = string
  description = "Number for public VLAN from `ibmcloud ks vlans --zone <ZONE>`"
  default = "2108607"
}

variable "kube_version" {
  default     = "1.23.10"
  description = "Version of Kubernetes to apply to the new Kubernetes cluster"
}

variable "cluster_namespace" {
  type        = string
  description = "Kubernetes namespace to deploy into. NOTE: If the namespace does not exist, it will be created."
  default = "default"
}
