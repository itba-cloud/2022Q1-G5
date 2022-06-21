
# ---------------------------------------------------------------------------
# AWS Lambda resources
# ---------------------------------------------------------------------------

# Lambda



resource "aws_lambda_permission" "apigw_lambda" {

  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "arn:aws:execute-api:${var.region}:${var.account_id}:${var.rest_api}/*/${var.http_method}${var.api_path}"
}

resource "aws_lambda_function" "this" {

  filename         = local.lambda_file_name
  function_name    = "AWSLambdaHandler-${replace(var.bucket_name, "-", "")}"
  role             = "arn:aws:iam::${var.account_id}:role/LabRole"
  handler          = "uploadMP3.main"
  runtime          = "python3.9"
  source_code_hash = filebase64sha256("${local.lambda_file_name}")

  lifecycle {
    create_before_destroy = true
  }

  environment {
    variables = {
      bucket_name       = "${var.bucket_name}"
      dynamo_table_name = "${var.podcast_table}"
    }
  }
}


# resource "aws_lambda_layer_version" "lambda_layer_1" {
#   arn="arn:aws:lambda:us-east-1:336392948345:layer:AWSDataWrangler-Python39:1"
#   layer_name = "lambda_layer_1"

#   compatible_runtimes = ["python3.9"]
# }