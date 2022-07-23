module "api_gateway" {
  source = "./modules/api_gateway"

  invoke_arn = module.lambda.invoke_arn
  
  subs_invoke_arn = module.lambda.subs_invoke_arn

  providers = {
    aws = aws.aws
  }

  name = "PodcastAPIGateway"
  
  description = "API Gateway for Podcasts"

}