module "api_gateway" {
  source = "./modules/api_gateway"

  invoke_arn = module.lambda.invoke_arn

  providers = {
    aws = aws.aws
  }

}