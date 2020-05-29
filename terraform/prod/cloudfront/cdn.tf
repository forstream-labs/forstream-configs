locals {
  origin_id = "forstream-public-s3-bucket"
}

resource "aws_cloudfront_origin_access_identity" "forstream_cdn" {
  comment = "access-identity-${local.origin_id}"
}

resource "aws_cloudfront_distribution" "forstream_cdn" {
  enabled = true
  is_ipv6_enabled = true
  aliases = [var.forstream_cdn_acm_certificate_domain_name]

  origin {
    origin_id = local.origin_id
    domain_name = var.forstream_public_s3_bucket_regional_domain_name

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.forstream_cdn.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    target_origin_id = local.origin_id
    viewer_protocol_policy = "https-only"
    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods = ["GET", "HEAD"]

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = var.forstream_cdn_acm_certificate_arn
    ssl_support_method = "sni-only"
  }

  tags = {
    Environment = var.environment
  }
}

resource "aws_s3_bucket_policy" "forstream_cdn_read_access" {
  bucket = var.forstream_public_s3_bucket_id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "PolicyForCloudFrontPrivateContent",
  "Statement": [
    {
      "Sid": "1",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${aws_cloudfront_origin_access_identity.forstream_cdn.iam_arn}"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${var.forstream_public_s3_bucket_name}/*"
    }
  ]
}
POLICY
}

resource "aws_route53_record" "forstream_cdn_alias" {
  zone_id = var.forstream_route_53_zone_id
  name = "cdn.${var.forstream_route_53_zone_name}"
  type = "A"

  alias {
    name = aws_cloudfront_distribution.forstream_cdn.domain_name
    zone_id = aws_cloudfront_distribution.forstream_cdn.hosted_zone_id
    evaluate_target_health = false
  }
}
