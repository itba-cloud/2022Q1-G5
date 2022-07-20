output "s3_domain" {
  description = "Domain for S3"
  value       = aws_s3_bucket.cloudfront_bucket.bucket_regional_domain_name
}

output "bucket_name" {
  description = "Podcast bucket"
  value       = aws_s3_bucket.podcast_bucket.bucket
}

output "bucket_id" {
  description = "ID for Podcast bucket"
  value       = aws_s3_bucket.podcast_bucket.id
}

output "front_bucket_id" {
  description = "ID for front bucket"
  value       = aws_s3_bucket.front_bucket.id
}

output "bucket_arn" {
  description = "ARN for Podcast bucket"
  value       = aws_s3_bucket.podcast_bucket.arn
}

output "front_bucket_name" {
  description = "front bucket"
  value       = aws_s3_bucket.front_bucket.bucket
}

output "www_bucket_name" {
  description = "www bucket"
  value       = aws_s3_bucket.www_bucket.bucket
}

output "logs_bucket_name" {
  description = "logs bucket"
  value       = aws_s3_bucket.logs_bucket.bucket
}