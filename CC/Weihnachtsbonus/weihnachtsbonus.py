import boto3



client = boto3.client('sqs',region_name="us-east-1",aws_access_key_id = aws_access_key_id ,aws_secret_access_key = aws_secret_access_key,aws_session_token = aws_session_token)

response = client.send_message(
    QueueUrl='https://sqs.us-east-1.amazonaws.com/790933937313/Xmas2025',
    MessageBody="Test",
    MessageAttributes={
        "MatNr": {
            "DataType": "String",
            "StringValue": "20242565"
        },
        "StudentName": {
            "DataType": "String",
            "StringValue": "Nils Trawinski"
        },
        "Email-Adresse":{
            "DataType": "String",
            "StringValue": "trawinsk@th-brandenburg.de"
        },
        "ReplyURL":{
            "DataType" : "String",
            "StringValue" : "https://sqs.us-east-1.amazonaws.com/339712756098/MyQueue"
        }

    }
)

print(response)