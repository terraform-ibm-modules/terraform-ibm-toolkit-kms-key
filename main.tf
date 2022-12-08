
locals {
  name     = var.name != "" ? var.name : "${var.name_prefix}-${var.label}"
  root_key = var.provision ? ibm_kms_key.root_key[0] : data.ibm_kms_key.root_key[0].keys[0]
}

resource null_resource print_values {
  provisioner "local-exec" {
    command = "echo 'KMS id: ${var.kms_id}'"
  }
}

resource ibm_kms_key root_key {
  depends_on = [null_resource.print_values]
  count = var.provision && var.provision_key_rotation_policy ? 1 : 0

  instance_id  = var.kms_id
  key_name     = local.name
  standard_key = false
  force_delete = var.force_delete
}

resource ibm_kms_key_policies root_key_policy {
  count = var.provision ? 1 : 0
  instance_id = var.kms_id
  key_id = ibm_kms_key.root_key[0].key_id
  rotation {
    interval_month = var.rotation_interval
  }
  dual_auth_delete {
    enabled = var.dual_auth_delete
  }
}

data ibm_kms_key root_key {
  depends_on = [null_resource.print_values]
  count = !var.provision ? 1 : 0

  instance_id = var.kms_id
  key_name    = local.name
}
