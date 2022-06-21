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
      days          = local.bucket_ia_transition
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = local.bucket_glacier_transition
      storage_class = "GLACIER"
    }
  }
}