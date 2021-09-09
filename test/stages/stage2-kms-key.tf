module "kms_key" {
  source = "./module"

  region           = var.hpcs_region
  ibmcloud_api_key = var.ibmcloud_api_key
  name_prefix      = var.name_prefix
  label            = "test-key"
  provision        = true
  kms_id           = module.hpcs.guid
  kms_public_url   = module.hpcs.public_url
  kms_private_url  = module.hpcs.private_url
}
