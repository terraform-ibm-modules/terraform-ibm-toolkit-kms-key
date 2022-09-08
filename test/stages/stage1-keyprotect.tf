module "keyprotect" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-key-protect.git"

  resource_group_name      = module.resource_group.name
  region                   = var.region
  name_prefix              = var.name_prefix
  name                     = var.key_protect_name
  provision                = true
}
