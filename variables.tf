
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

variable "name_prefix" {
  type        = string
  description = "The name_prefix used to build the name if one is not provided. If used the name will be `{name_prefix}-{label}`"
  default     = "base"
}

variable "label" {
  type        = string
  description = "The label used to build the name if one is not provided. If used the name will be `{name_prefix}-{label}`"
  default     = "key"
}

variable "rotation_interval" {
  type        = number
  description = "The interval in months that a root key needs to be rotated."
  default     = 3
  validation {
    condition     = var.rotation_interval >= 1 && var.rotation_interval <= 12
    error_message = "The rotation interval must be 1 to 12 months."
  }
}

variable "dual_auth_delete" {
  type        = bool
  description = "Flag indicating that the key requires dual authorization to be deleted."
  default     = false
}

variable "force_delete" {
  type        = bool
  description = "Flag indicating that 'force' should be applied to key on delete"
  default     = true
}
