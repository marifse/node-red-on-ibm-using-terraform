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
