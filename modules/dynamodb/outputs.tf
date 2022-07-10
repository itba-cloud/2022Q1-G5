output "podcast_table" {
  description = "Invoke ARN for API GW"
  value       = aws_dynamodb_table.podcasts-table.name
}