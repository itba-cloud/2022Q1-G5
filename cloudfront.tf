module "cloudfront" {

  source          = "./modules/cloudfront"
  domain_name     = module.s3.s3_domain
  api_domain_name = module.api_gateway.domain_name

  depends_on = [
    module.s3,
    module.api_gateway
  ]
}