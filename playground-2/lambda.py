import boto3

def lambda_handler(event, context):
    ses = boto3.client('ses', region_name='bucket-region')
    sender_mail = 'youremail'
    reciver_mail = 'youremail'
    subject = 'Test Email'
    body = "Test Test"
    response = ses.send_email(
        Source=sender_mail,  
        Destination={
            'ToAddresses': [
                reciver_mail,
            ],
        },
        Message={
            'Subject': {
                'Data': subject,
            },
            'Body': {
                'Text': {
                    'Data': body,
                },
            },
        },
    )
    return {
        'statusCode': 200,
        'body': 'Email sent successfully.',
    }
