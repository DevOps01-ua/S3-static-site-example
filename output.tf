output "website_endpoint" {
  value = aws_s3_bucket.website_bucket.website_endpoint
}


output "cloudfrount_domain" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}


output "s3_bucket_name" {
  value = aws_s3_bucket.website_bucket.id
}