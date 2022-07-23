module "s3" {

  source = "./modules/s3"

  providers = {
    aws = aws.aws
  }

  bucket_name            = join("-", [data.aws_caller_identity.current.account_id, "itba-tp-podcasts-bucket2"])
  cloudfront_bucket_name = join("-", [data.aws_caller_identity.current.account_id, "itba-tp-podcasts-cloudfront-bucket"])

  bucket_ia_transition      = 30
  bucket_glacier_transition = 60

  www_bucket_name = join("-", [data.aws_caller_identity.current.account_id, "itba-tp-www-bucket"])
  front_bucket_name = join("-", [data.aws_caller_identity.current.account_id, "itba-tp-front-bucket"])
  logs_bucket_name = join("-", [data.aws_caller_identity.current.account_id, "itba-tp-logs-bucket"])
}

resource "aws_s3_object" "this" {
  provider = aws.aws

  bucket        = module.s3.front_bucket_id
  key           = "index.html"
  content_type  = "text/html"
  storage_class = "STANDARD"
}
