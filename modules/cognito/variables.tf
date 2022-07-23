variable "pool_name" {
  type        = string
  description = "User pool's name"
}

variable "user_group_name" {
  type        = string
  description = "User group name for pool"
}

variable "identity_pool_name" {
  type        = string
  description = "Identity pool name"
}

variable "allow_unauthenticated_identities" {
  type = bool
  default = false
  description = "Allow unauthenticated identities"
}

variable "allow_classic_flow" {
  type = bool
  default = false
  description = "Allow classic flow"
}