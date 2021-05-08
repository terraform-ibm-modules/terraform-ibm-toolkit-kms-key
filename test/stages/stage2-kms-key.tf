module "kms_key" {
  source = "./module"

  region           = var.hpcs_region
  ibmcloud_api_key = var.ibmcloud_api_key
  name_prefix      = var.name_prefix
  label            = "test-key"
  provision        = var.kms_key_provision
  kms_id           = module.hpcs.guid
}
