variable "invoke_arn" {
  type        = string
  description = "Invoke ARN from Lambda"
}

variable "name" {
  type        = string
  description = "Name for API Gateway"
}

variable "description" {
  type = string
  description = "Description for API Gateway"
}

variable "subs_invoke_arn" {
  type        = string
  description = "Subsicription Invoke ARN from Lambda"
}