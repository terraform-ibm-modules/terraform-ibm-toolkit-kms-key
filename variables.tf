
variable "region" {
  type        = string
  description = "The IBM Cloud region where the cluster will be/has been installed."
}

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud api token"
}

variable "provision" {
  type        = bool
  description = "Flag indicating that the key should be provisioned. If false then an existing key will be looked up"
  default     = false
}

variable "kms_id" {
  type        = string
  description = "The id of the kms instance. Required if kms_enabled is true"
  default     = ""
}

variable "name" {
  type        = string
  description = "The name of the root key in the kms instance. Required if kms_enabled is true"
  default     = ""
}
