#!/bin/bash -e

echo "Creating \"$SQS_QUEUE_NAME\" SQS queue..."

aws sqs create-queue \
    --endpoint-url=http://localhost:4576 \
    --queue-name $MY_QUEUE_NAME

echo "Created \"$MY_QUEUE_NAME\" SQS queue."
