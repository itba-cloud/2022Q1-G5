output "domain_name" {
  description = "Domain name for API Gateway"
  value       = replace(aws_api_gateway_deployment.this.invoke_url, "/^https?://([^/]*).*/", "$1")
}

output "rest_api" {
  description = "REST API ID"
  value       = aws_api_gateway_rest_api.this.id
}

output "http_method" {
  description = "HTTP Method"
  value       = aws_api_gateway_method.this.http_method
}

output "api_path" {
  description = "API path"
  value       = aws_api_gateway_resource.this.path
}