data "ibm_resource_group" "rg" {
  name = "Default"
}
resource "ibm_cr_namespace" "rg_namespace" {
  name              = var.namespace_name
  resource_group_id = data.ibm_resource_group.rg.id

}

resource "ibm_code_engine_project" "code_engine_project_instance" {
  name              = var.projectName
  resource_group_id = data.ibm_resource_group.rg.id
}

resource "ibm_code_engine_app" "code_engine_app_instance" {
  project_id      = ibm_code_engine_project.code_engine_project_instance.project_id
  name            = var.application_name
  image_reference = "nodered/node-red"
  image_port =  "1880"
}
