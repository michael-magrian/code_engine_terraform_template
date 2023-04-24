##############################################################################
# Account Variables
##############################################################################

variable "ibmcloud_api_key" {
  description = "API key to access IBM Cloud."
  type        = string
}

variable "ibmcloud_region" {
  description = "The region to which to deploy the VPC."
  type        = string
  default     = "eu-de"
}

variable "ibmcloud_resource_group_name" {
  description = "The name if the resource group that is used to create resources."
  type        = string
  default     = "Default"
}

##############################################################################
# Resource Variables
##############################################################################

variable "code_engine_project_name" {
  description = "The name of the project."
  type        = string
  default     = "my-terraform-project"
}

variable "code_engine_config_map_name" {
  description = "The name of the config map."
  type        = string
  default     = "my-data-map"
}

variable "code_engine_config_map_data" {
  description = "The key-value pair for the config map."
  type        = map(string)
  default     = { "hello" = "world" }
}

variable "code_engine_app_name" {
  description = "The name of the app."
  type        = string
  default     = "my-app"
}

variable "code_engine_app_image_reference" {
  description = "The name of the image that is used for this app."
  type        = string
  default     = "icr.io/codeengine/helloworld"
}
