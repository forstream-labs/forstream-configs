output "id" {
  value = aws_s3_bucket.main.id
}

output "name" {
  value = aws_s3_bucket.main.bucket
}

output "arn" {
  value = aws_s3_bucket.main.arn
}

output "bucket_domain_name" {
  value = aws_s3_bucket.main.bucket_domain_name
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.main.bucket_regional_domain_name
}
