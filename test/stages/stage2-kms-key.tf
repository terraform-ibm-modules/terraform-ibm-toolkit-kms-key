module "kms_key" {
  source = "./module"

  name_prefix      = var.name_prefix
  label            = "test-key"
  provision        = true
  kms_id           = module.hpcs.guid
  kms_public_url   = module.hpcs.public_url
  kms_private_url  = module.hpcs.private_url
}
