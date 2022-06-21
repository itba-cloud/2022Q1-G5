module "lambda" {

  source = "./modules/lambda"

  providers = {
    aws = aws.aws
  }

  bucket_name = module.s3.bucket_name

  region = data.aws_region.current.name

  account_id = data.aws_caller_identity.current.account_id

  rest_api = module.api_gateway.rest_api

  http_method = module.api_gateway.http_method

  api_path = module.api_gateway.api_path

  podcast_table = module.dynamodb.podcast_table



}