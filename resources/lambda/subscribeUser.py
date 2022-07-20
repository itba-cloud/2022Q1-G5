import boto3
import json
import os

def main(event, context):
    client = boto3.client('ssm')   
    
    #Upload row into dynamoDB
    dynamodb = boto3.client('dynamodb')
    table_name = os.environ.get('dynamo_table_name')
    dynamodb.put_item(TableName=table_name, Item={'email': {'S': event['email'] },'UserId': {'N' : event['user_id'] }})

    body = f"Se ha ingresado el usuario {event['email']} correctamente"
    resp = {
		"statusCode": 200,
		"headers": {
			"Access-Control-Allow-Origin": "*",
		},
		"body": body
	  }
	
	

    return resp