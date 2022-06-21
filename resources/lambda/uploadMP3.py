import boto3
import json
import os

def main(event, context):
    client = boto3.client('ssm')
    bucket_name = os.environ.get('bucket_name')
    #Upload file into s3
    s3 = boto3.client('s3')
    uploadByteStream = bytes(json.dumps(event).encode('UTF-8'))
    s3.put_object(Body=uploadByteStream,
     Bucket=bucket_name,
     Key= event['title'])
    
    #Upload row into dynamoDB
    dynamodb = boto3.client('dynamodb')
    table_name = os.environ.get('dynamo_table_name')
    url = f"https://s3.us-east-1.amazonaws.com/{bucket_name}/{event['title']}"
    dynamodb.put_item(TableName=table_name, Item={'Title': {'S': event['title'] },'Url': {'S' : url}})

    body = f"Se ha ingresado el archivo {event['title']} correctamente"
    resp = {
		"statusCode": 200,
		"headers": {
			"Access-Control-Allow-Origin": "*",
		},
		"body": body
	  }
	
	

    return resp