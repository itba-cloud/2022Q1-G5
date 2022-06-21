module "Cognito" {
  source    = "./modules/cognito"
  pool_name = "mypool"
  providers = {
    aws = aws.aws
  }
}