#!/bin/bash -e

echo "Updating \"$MY_ZIP_FILE\" zip file..."

cd $MY_APP_DIR && \
    zip -ru $MY_ZIP_FILE src/ node_modules && \
    chmod 755 $MY_ZIP_FILE; \
    cd -

echo "Updated \"$MY_ZIP_FILE\" zip file."
