variable "domain_name" {
  type = string
  description = "Domain name for S3"
}

variable "api_domain_name" {
  type = string
  description = "Domain name for API GW"
}

variable "s3_origin_id" {
  type = string
  description = "Origin ID for S3"
}

variable "apigw_origin_id" {
  type = string
  description = "Origin ID for API GW"
}