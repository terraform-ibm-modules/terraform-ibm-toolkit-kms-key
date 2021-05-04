
locals {
  root_key = var.provision ? ibm_kms_key.root_key[0] : data.ibm_kms_key.root_key[0].keys[0]
}

resource null_resource print_values {
  provisioner "local-exec" {
    command = "echo 'KMS id: ${var.kms_id}'"
  }
}

resource ibm_kms_key root_key {
  depends_on = [null_resource.print_values]
  count = var.provision ? 1 : 0

  instance_id = var.kms_id
  key_name    = var.name
  standard_key = false
}

data ibm_kms_key root_key {
  depends_on = [null_resource.print_values]
  count = !var.provision ? 1 : 0

  instance_id = var.kms_id
  key_name    = var.name
}