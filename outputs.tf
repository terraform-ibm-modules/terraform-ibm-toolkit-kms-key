output "id" {
  description = "The id of the key"
  value       = var.provision ? ibm_kms_key.root_key[0].key_id : data.ibm_kms_key.root_key[0].keys[0].id
}

output "name" {
  description = "The crn of the key"
  value       = var.provision ? var.name : data.ibm_kms_key.root_key[0].keys[0].id
  depends_on  = [ibm_kms_key.root_key, data.ibm_kms_key.root_key]
}

output "crn" {
  description = "The crn of the key"
  value       = local.root_key.crn
}

output "kms_id" {
  description = "The id of the kms instance"
  value       = var.kms_id
  depends_on  = [ibm_kms_key.root_key, data.ibm_kms_key.root_key]
}

output "kms_public_url" {
  description = "The public url of the kms instance"
  value       = var.kms_public_url
}

output "kms_private_url" {
  description = "The private url of the kms instance"
  value       = var.kms_private_url
}
