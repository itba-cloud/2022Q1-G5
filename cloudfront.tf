module "cloudfront" {
  providers = {
    aws = aws.aws
  }
  source          = "./modules/cloudfront"
  domain_name     = module.s3.s3_domain
  api_domain_name = module.api_gateway.domain_name

  s3_origin_id    = "podcastS3Origin"
  apigw_origin_id = "apigw"
}