module "kms_key" {
  source = "./module"

  name_prefix      = var.name_prefix
  label            = "test-key"
  provision        = true
  kms_id           = module.keyprotect.guid
  kms_public_url   = module.keyprotect.public_url
  kms_private_url  = module.keyprotect.private_url
}
