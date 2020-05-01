import json
import decimal
import boto3
from boto3.dynamodb.conditions import Key, Attr

# Helper class to convert a DynamoDB item to JSON.
class DecimalEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, decimal.Decimal):
            if abs(o) % 1 > 0:
                return float(o)
            else:
                return int(o)
        return super(DecimalEncoder, self).default(o)

dynamodb = boto3.resource('dynamodb', region_name='us-west-2', endpoint_url="http://localhost:8000")
table = dynamodb.Table('Posts')


def createPostsTable():
    table = dynamodb.create_table(
        TableName='Posts',
        KeySchema=[
            {
                'AttributeName': 'PostID',
                'KeyType': 'HASH'  #Partition key
            }
        ],
        AttributeDefinitions=[
            {
                'AttributeName': 'PostID',
                'AttributeType': 'N'
            },
            {
                'AttributeName': 'date',
                'AttributeType': 'S'
            },
            {
                'AttributeName': 'subreddit',
                'AttributeType': 'S'
            },
            {
                'AttributeName': 'home',
                'AttributeType': 'S'
            }
        ],
        GlobalSecondaryIndexes=[
                {
                    "IndexName": "subreddit-index",
                    "Projection": {
                        "ProjectionType": "ALL"
                    },
                    "KeySchema": [
                        {
                            "KeyType": "HASH",
                            "AttributeName": "subreddit"
                        },
                        {
                            'AttributeName': 'date',
                            'KeyType': 'RANGE'  #Sort key
                        }
                    ],
                    "ProvisionedThroughput":{
                        'ReadCapacityUnits': 10,
                        'WriteCapacityUnits': 10
                    }
                },
                {
                    "IndexName": "home-index",
                    "Projection": {
                        "ProjectionType": "ALL"
                    },
                    "KeySchema": [
                        {
                            "KeyType": "HASH",
                            "AttributeName": "home"
                        },
                        {
                            'AttributeName': 'date',
                            'KeyType': 'RANGE'  #Sort key
                        }
                    ],
                    "ProvisionedThroughput":{
                        'ReadCapacityUnits': 10,
                        'WriteCapacityUnits': 10
                    }
                },

            ],
        ProvisionedThroughput={
            'ReadCapacityUnits': 10,
            'WriteCapacityUnits': 10
        }
    )

    print("Table status:", table.table_status)

def deleteTable():
    table.delete()

def createPost(PostID,title,subreddit,text,username,date,url=None):
    response = table.put_item(
       Item={
            'home': 'home',
            'PostID' : PostID,
            'title': title,
            'subreddit': subreddit,
            'text': text,
            'username' : username,
            'date' : date,
            'url' : url
        }
    )
    print("PutItem succeeded:")
    # print(json.dumps(response, indent=4, cls=DecimalEncoder))
    return json.dumps(response, indent=4, cls=DecimalEncoder)
def getMostRecentID():
    response = table.query(
        IndexName="home-index",
        ProjectionExpression="PostID",
        KeyConditionExpression=Key('home').eq('home'),
        ScanIndexForward=False,
        Limit=1
    )

    # for i in response['Items']:
    #     print(json.dumps(i, cls=DecimalEncoder))
    # return json.dumps(response['Items'][],indent=4, cls=DecimalEncoder)
    return int(json.dumps(response['Items'][0]['PostID'],cls=DecimalEncoder))

def getAllPosts():

    pe = "#dt, title, subreddit,username"
    # Expression Attribute Names for Projection Expression only.
    ean = { "#dt": "date" }
    esk = None


    response = table.scan(
        ProjectionExpression=pe,
        ExpressionAttributeNames=ean
        )
    #
    # for i in response['Items']:
    #     print(json.dumps(i, cls=DecimalEncoder))
    # return json.dumps(response['Items'], cls=DecimalEncoder)

    while 'LastEvaluatedKey' in response:
        response = table.scan(
            ProjectionExpression=pe,
            # FilterExpression=fe,
            ExpressionAttributeNames= ean,
            ExclusiveStartKey=response['LastEvaluatedKey']
            )

        # for i in response['Items']:
        #     print(json.dumps(i, cls=DecimalEncoder))
    return json.dumps(response['Items'], cls=DecimalEncoder)



def getPost(PostID):
    response = table.query(
        ProjectionExpression="title,subreddit,#dt,username",
        ExpressionAttributeNames={ "#dt": "date" }, # Expression Attribute Names for Projection Expression only.
        KeyConditionExpression=Key('PostID').eq(PostID),
        ScanIndexForward=False,
    )

    # for i in response['Items']:
    #     print(json.dumps(i, cls=DecimalEncoder))
    return json.dumps(response['Items'],indent=4, cls=DecimalEncoder)

def deletePost(PostID):
    try:
        response = table.delete_item(
        Key={
            'PostID': PostID
        }
    )
    except ClientError as e:
        if e.response['Error']['Code'] == "ConditionalCheckFailedException":
            print(e.response['Error']['Message'])
        else:
            raise
    else:
        print("DeleteItem succeeded:")
        return json.dumps(response['Items'],indent=4, cls=DecimalEncoder)

def nMostRecentPosts(n):
    response = table.query(
        IndexName="home-index",
        ProjectionExpression="title,subreddit,#dt,username",
        ExpressionAttributeNames={ "#dt": "date" }, # Expression Attribute Names for Projection Expression only.
        KeyConditionExpression=Key('home').eq('home'),
        ScanIndexForward=False,
        Limit=n
    )

    # for i in response['Items']:
    #     print(json.dumps(i, cls=DecimalEncoder))
    return json.dumps(response['Items'],indent=4, cls=DecimalEncoder)

def nMostRecentPostsSubreddit(subreddit,n):
    response = table.query(
        IndexName="subreddit-index",
        ProjectionExpression="title,subreddit,#dt,username",
        ExpressionAttributeNames={ "#dt": "date" }, # Expression Attribute Names for Projection Expression only.
        KeyConditionExpression=Key('subreddit').eq(subreddit),
        ScanIndexForward=False,
        Limit=n

    )

    # for i in response['Items']:
    #     print(json.dumps(i, cls=DecimalEncoder))
    return json.dumps(response['Items'],indent=4, cls=DecimalEncoder)
