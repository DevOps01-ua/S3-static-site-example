resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    connection_attempts = 3
    connection_timeout  = 10
    domain_name = aws_s3_bucket.website_bucket.website_endpoint
    origin_id   = "S3Origin"


    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
      origin_keepalive_timeout = 5
      origin_read_timeout     = 30
    }

  }

  enabled             = true
  default_root_object = "index.html"

  # Using only US, Canada, and Europe to stay in Free Tier
  price_class = "PriceClass_100"


  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3Origin"
    cache_policy_id        = data.aws_cloudfront_cache_policy.this.id
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
  wait_for_deployment = false
}