module "kms_key" {
  source = "./module"

  region           = var.hpcs_region
  ibmcloud_api_key = var.ibmcloud_api_key
  name_prefix      = var.name_prefix
  label            = "test-key"
  provision        = true
  kms_id           = module.hpcs.guid
}
