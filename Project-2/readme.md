To delete the Posts Table
Go to directory of Project 2 
Open python3 terminal - Make sure to set ENV variables, make sure to have dynamo installed locally, and run 
java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb 
Make sure to have boto3 installed
from api import delete_aws
delete_aws()
to create a table
from api import init_aws
init_aws()
To test posts run the file
./postTest.sh
