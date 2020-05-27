output "forstream_cdn_certificate_arn" {
  value = module.forstream_cdn_acm_certificate.arn
}

output "forstream_cdn_certificate_domain_name" {
  value = module.forstream_cdn_acm_certificate.domain_name
}
