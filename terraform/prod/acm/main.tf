module "forstream_cdn_acm_certificate" {
  source = "../../modules/acm_certificate"

  environment = var.environment
  domain_name = "cdn.${var.forstream_route_53_zone_name}"
  zone_id = var.forstream_route_53_zone_id
}
