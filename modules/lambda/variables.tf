variable "bucket_name" {
  description = "Bucket name"
  type        = string
}

variable "region" {
  description = "region"
  type        = string
}

variable "account_id" {
  description = "region"
  type        = string
}

variable "rest_api" {
  description = "rest api"
  type        = string
}

variable "http_method" {
  description = "http method"
  type        = string
}

variable "api_path" {
  description = "api path"
  type        = string
}


variable "podcast_table" {
  description = "podcasts table name"
  type        = string
}

variable "subscriber_table" {
  description = "subscriber table name"
  type        = string
}

variable "lambda_file_name" {
  description = "File name for Lambda"
  type        = string
}

variable "lambda_subscribe_name" {
  description = "Suscribe name for Lambda"
  type        = string
}

variable "handler" {
  description = "Handler for Lambda"
  type        = string
}

variable "subscribe_handler" {
  description = "Suscribe Handler for Lambda"
  type        = string
}

variable "runtime" {
  description = "Runtime for Lambda"
  type        = string
}

variable "role" {
  description = "Role for Lambda"
  type        = string
}

variable "function_name" {
  description = "Bucket name for Lambda"
  type        = string 
}

variable "function_subscribe_name" {
  description = "Subscribe name for Lambda"
  type        = string 
}

variable "lambda_get_podcast_file_name" {
  description = "Get Podcast Lambda File Name"
  type        = string
}
  
variable "get_podcast_handler" {
  description = "Get Podcast Handler"
  type        = string
}
    
variable "get_podcast_runtime" { 
  description = "Get Podcast Runtime"
  type        = string
}  

variable "function_get_podcast_name" {
  description = "Get Podcast Function Name"
  type        = string
}