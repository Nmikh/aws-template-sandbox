aws sqs send-message --queue-url https://sqs.us-west-2.amazonaws.com/XXXXXXXXXXX/sqs_queue --message-body "Information about the largest city in Any Region."
aws sqs receive-message --queue-url https://sqs.us-west-2.amazonaws.com/XXXXXXXXXXX/sqs_queue

aws sns publish --topic-arn "arn:aws:sns:us-west-2:XXXXXXXXXXX:sns_topic" --message "Information about the largest city in Any Region."
