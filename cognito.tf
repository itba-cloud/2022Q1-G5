module "cognito" {
  source    = "./modules/cognito"
  for_each = local.cognito_user_groups
  
  pool_name													= each.value.pool_name
	identity_pool_name 								= each.value.identity_pool_name
	user_group_name 									= each.value.user_group_name
  
  providers = {
    aws = aws.aws
  }
}

resource "aws_cognito_user" "this" {
  user_pool_id = module.cognito["listeners"].user_pool_id
  username = "podcast-user"
}