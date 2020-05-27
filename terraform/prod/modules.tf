module "acm" {
  source = "./acm"

  environment = var.environment
  forstream_route_53_zone_id = module.route_53.forstream_zone_id
  forstream_route_53_zone_name = module.route_53.forstream_zone_name
}

module "cloudfront" {
  source = "./cloudfront"

  environment = var.environment
  forstream_route_53_zone_id = module.route_53.forstream_zone_id
  forstream_route_53_zone_name = module.route_53.forstream_zone_name
  forstream_cdn_acm_certificate_arn = module.acm.forstream_cdn_certificate_arn
  forstream_cdn_acm_certificate_domain_name = module.acm.forstream_cdn_certificate_domain_name
  forstream_public_s3_bucket_regional_domain_name = module.s3.forstream_public_bucket_regional_domain_name
}

module "ec2" {
  source = "./ec2"

  environment = var.environment
  region = var.region
  forstream_route_53_zone_id = module.route_53.forstream_zone_id
  forstream_route_53_zone_name = module.route_53.forstream_zone_name
}

module "ecr" {
  source = "./ecr"

  environment = var.environment
}

module "route_53" {
  source = "./route_53"

  environment = var.environment
}

module "s3" {
  source = "./s3"

  environment = var.environment
}
