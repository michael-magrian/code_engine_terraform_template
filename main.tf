provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.ibmcloud_region
}

##############################################################################
# Get resource group ID
##############################################################################

data "ibm_resource_group" "my_resource_group" {
  name = var.ibmcloud_resource_group_name
}

##############################################################################
# Create Code Engine project infrastructure
##############################################################################

resource "ibm_code_engine_project" "my_project_instance" {
  name              = var.code_engine_project_name
  resource_group_id = data.ibm_resource_group.my_resource_group.id
}


resource "ibm_code_engine_config_map" "code_engine_config_map_data" {
  project_id = ibm_code_engine_project.my_project_instance.project_id
  name       = var.code_engine_config_map_name
  data       = var.code_engine_config_map_data

  depends_on = [
    ibm_code_engine_project.my_project_instance
  ]
}

resource "ibm_code_engine_app" "code_engine_app_instance" {
  project_id      = ibm_code_engine_project.my_project_instance.project_id
  image_reference = var.code_engine_app_image_reference
  name            = var.code_engine_app_name

  run_env_variables {
    reference = ibm_code_engine_config_map.code_engine_config_map_data.name
    type      = "config_map_full_reference"
  }

  depends_on = [
    ibm_code_engine_config_map.code_engine_config_map_data
  ]

  lifecycle {
    ignore_changes = [
      run_env_variables
    ]
  }
}
