output "forstream_public_bucket_id" {
  value = module.forstream_public_s3_bucket.id
}

output "forstream_public_bucket_arn" {
  value = module.forstream_public_s3_bucket.arn
}

output "forstream_public_bucket_regional_domain_name" {
  value = module.forstream_public_s3_bucket.bucket_regional_domain_name
}
