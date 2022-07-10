output "invoke_arn" {
  description = "Invoke ARN for API GW"
  value       = aws_lambda_function.this.invoke_arn
}