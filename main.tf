
locals {
  root_key = var.provision ? ibm_kms_key.root_key[0] : data.ibm_kms_key.root_key[0].keys[0]
}

resource ibm_kms_key root_key {
  count = var.provision ? 1 : 0

  instance_id = var.kms_id
  key_name    = var.name
  standard_key = false
}

data ibm_kms_key root_key {
  count = !var.provision ? 1 : 0

  instance_id = var.kms_id
  key_name    = var.name
}
