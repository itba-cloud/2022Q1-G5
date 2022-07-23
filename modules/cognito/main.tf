resource "aws_cognito_user_pool" "this" {
  name = var.pool_name
}

resource "aws_cognito_user_group" "this" {
  name = var.user_group_name
  user_pool_id = aws_cognito_user_pool.this.id
}

resource "aws_cognito_identity_pool" "this" {
  identity_pool_name = var.identity_pool_name
  allow_unauthenticated_identities = var.allow_unauthenticated_identities
  allow_classic_flow = var.allow_classic_flow
}