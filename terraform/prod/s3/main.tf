module "forstream_public_s3_bucket" {
  source = "../../modules/s3_bucket"

  environment = var.environment
  bucket = "forstream-public"
  acl = "private"
}

module "forstream_private_s3_bucket" {
  source = "../../modules/s3_bucket"

  environment = var.environment
  bucket = "forstream-private"
  acl = "private"
}

module "forstream_backups_s3_bucket" {
  source = "../../modules/s3_bucket"

  environment = var.environment
  bucket = "forstream-backups"
  acl = "private"
}
