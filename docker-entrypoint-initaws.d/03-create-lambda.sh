#!/bin/bash -e

LAMBDA_ENV_FILE=$MY_APP_DIR/container.env

echo "Loading \"$LAMBDA_ENV_FILE\" environment variables..."

source $LAMBDA_ENV_FILE

echo "Loaded \"$LAMBDA_ENV_FILE\" environment variables."

LAMBDA_ENVIRONMENT_VARIABLES=NODE_ENV=$NODE_ENV

echo "Creating \"$MY_FUNCTION_NAME\" lambda function..."

aws lambda create-function \
    --endpoint-url=http://localhost:4574 \
    --function-name $MY_FUNCTION_NAME \
    --handler src/index.handler \
    --role none \
    --runtime nodejs10.x \
    --environment Variables={$LAMBDA_ENVIRONMENT_VARIABLES} \
    --zip-file fileb://$MY_ZIP_FILE

echo "Created \"$MY_FUNCTION_NAME\" lambda function."
