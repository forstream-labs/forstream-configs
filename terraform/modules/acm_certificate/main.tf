resource "aws_acm_certificate" "main" {
  domain_name = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Environment = var.environment
  }
}

resource "aws_route53_record" "certificate_validation" {
  count = length(aws_acm_certificate.main.subject_alternative_names) + 1

  zone_id = var.zone_id
  name = aws_acm_certificate.main.domain_validation_options[count.index].resource_record_name
  type = aws_acm_certificate.main.domain_validation_options[count.index].resource_record_type
  records = [aws_acm_certificate.main.domain_validation_options[count.index].resource_record_value]
  ttl = 300
}

resource "aws_acm_certificate_validation" "main" {
  certificate_arn = aws_acm_certificate.main.arn
  validation_record_fqdns = [for record in aws_route53_record.certificate_validation : record.fqdn]
}
