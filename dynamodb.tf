module "dynamodb" {
  source = "./modules/dynamodb"

  providers = {
    aws = aws.aws
  }

  prefix = data.aws_caller_identity.current.account_id

}