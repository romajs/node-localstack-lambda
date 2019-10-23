#!/bin/bash -e

cd $MY_APP_DIR && SHELL=/bin/bash npm run update-lambda:watch &
