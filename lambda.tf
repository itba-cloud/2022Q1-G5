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

  subscriber_table = module.dynamodb.subscriptions_table

  lambda_file_name = "./resources/lambda/uploadMP3.zip"

  lambda_subscribe_name = "./resources/lambda/subscribeUser.zip"

  lambda_get_podcast_file_name = "./resources/get-podcast-lambda/dist.zip"

  handler = "uploadMP3.main"

  subscribe_handler = "subscribeUser.main"
  
  get_podcast_handler = "index.handler"

  runtime = "python3.9"

  get_podcast_runtime = "nodejs16.x"

  role = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/LabRole"

  function_name = "AWSLambdaHandler-${replace(module.s3.bucket_name, "-", "")}"

  function_subscribe_name = "AWSLambdaHandler-subscribeUser"
  
  function_get_podcast_name = "AWSLambdaHandler-GetPodcast"
}