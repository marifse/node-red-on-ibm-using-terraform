variable "ibmcloud_api_key" {
  description = "IBM Cloud API key"
  type        = string
  default = ""
}

variable "namespace_name" {
  type = string
  default = "my_springboot_namespace_1"
}

variable "application_name" {
  type = string
  default = "nodered"
}

variable "imageURLRegistry" {
  type = string
  default = "private.us.icr.io"
}

variable "authRegitry" {
  type = string
  default = "us.icr.io"
}

variable "projectName" {
  type = string
  default = "Nodered-CE"
}
