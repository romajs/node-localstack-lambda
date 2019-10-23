#!/bin/bash -e

echo "Retrieving \"$MY_QUEUE_NAME\" ARN..."

MY_QUEUE_ARN=$(
aws sqs get-queue-attributes \
    --output text \
    --endpoint-url http://localhost:4576 \
    --queue-url=http://localhost:4576/queue/$MY_QUEUE_NAME \
    --attribute-names QueueArn \
    | cut -f2
)

echo "Found \"$MY_QUEUE_ARN\"."

echo "Creating \"$MY_FUNCTION_NAME\" lambda trigger..."

aws lambda create-event-source-mapping \
    --endpoint-url=http://localhost:4574 \
    --function-name $MY_FUNCTION_NAME \
    --event-source-arn $MY_QUEUE_ARN

echo "Created \"$MY_FUNCTION_NAME\ lambda trigger."
