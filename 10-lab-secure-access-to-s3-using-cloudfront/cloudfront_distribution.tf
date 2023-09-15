locals {
  s3_origin_id = "myS3Origin"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Nadir-CloudFront"
  price_class = "PriceClass_200"

  origin {
    domain_name              = aws_s3_bucket.my_bucket.bucket_regional_domain_name
    origin_id                = local.s3_origin_id
  }

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 10
    max_ttl                = 20
  }


  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }


}


output "distribution_arn" {
  value = aws_cloudfront_distribution.s3_distribution.arn
}

output "distribution_domain_name" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}