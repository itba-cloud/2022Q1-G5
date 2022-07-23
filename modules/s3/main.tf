resource "aws_s3_bucket" "cloudfront_bucket" { #TODO mover esto a un s3.tf para todos los buckets
  bucket = var.cloudfront_bucket_name

  tags = {
    Name = "Cloudfront bucket"
  }
}

resource "aws_s3_bucket" "podcast_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "Podcast Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "front_bucket" {
    bucket              = var.front_bucket_name
    object_lock_enabled = false
}

resource "aws_s3_bucket" "www_bucket" {
    bucket              = var.www_bucket_name
    object_lock_enabled = false
}

resource "aws_s3_bucket" "logs_bucket" {
    bucket              = var.logs_bucket_name
    object_lock_enabled = false
}

resource "aws_s3_bucket_acl" "podcast_bucket" {
  bucket = aws_s3_bucket.podcast_bucket.id
  acl    = "private"
}


#this triggers the lifecycle policy of the arquitecture
resource "aws_s3_bucket_lifecycle_configuration" "podcast_bucket" {

  depends_on = [
    aws_s3_bucket.podcast_bucket
  ]

  bucket = aws_s3_bucket.podcast_bucket.bucket

  rule {
    id = "podcasts"


    # filter {
    #   and {
    #     prefix = "podcasts/"
    #   }
    # }

    status = "Enabled"

    transition {
      days          = var.bucket_ia_transition
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = var.bucket_glacier_transition
      storage_class = "GLACIER"
    }
  }
}

resource "aws_s3_bucket_website_configuration" "this" {
    bucket = aws_s3_bucket.front_bucket.id

    index_document {
        suffix = "index.html"
    }

    error_document {
        key = "error.html"
    }
}