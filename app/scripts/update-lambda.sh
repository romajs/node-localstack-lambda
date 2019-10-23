#!/bin/bash -e

cd $MY_APP_DIR && ./scripts/update-zip.sh

echo "Updating $MY_FUNCTION_NAME LAMBDA function..."

aws lambda update-function-code \
    --endpoint-url=http://localhost:4574 \
    --function-name $MY_FUNCTION_NAME \
    --zip-file fileb://$MY_ZIP_FILE \

echo "Updated $MY_FUNCTION_NAME LAMBDA function."
