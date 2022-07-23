import {DynamoDBClient, GetItemCommand} from "@aws-sdk/client-dynamodb";

const getPodcastByTitleFromDynamoDB = async (title: string) => {
    const tableName = process.env.PODCASTS_TABLE_NAME;

    if(!tableName) { 
        throw new Error('PODCASTS_TABLE_NAME is not set');
    }

    const dynamodb = new DynamoDBClient({region: "us-east-1"});

    const params = {
        TableName: tableName,
        Key: {
            Title: {N: title}
        },
        ProjectionExpression: 'ATTRIBUTE_NAME',
    };

    const result = await dynamodb.send(new GetItemCommand(params));

    return result.Item;
}

exports.handler = (request: any) => {
    const title = request.queryStringParameters.title;

    if (!title) {
        return {
            statusCode: 400,
            body: JSON.stringify({
                error: 'queryparam title is required'
            })
        };
    }

    let podcast;
    try {
        podcast = getPodcastByTitleFromDynamoDB(title);
    } catch(error) {
        return {
            statusCode: 500,
            body: JSON.stringify({
                error: `Unexpected error: ${error}`
            })
        };
    }

    if (!podcast) {
        return {
            statusCode: 404,
            body: JSON.stringify({
                error: `podcast not found with title: ${title}`
            })
        };
    }

    return {
        statusCode: 200,
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            podcast,
        }),
    };
}
