#!/bin/bash

APP_NAME="ThingsBoard JavaScript Executor Microservice"

APP_SHORT_NAME="tb-js-executor"

APP_DIRECTORY="/usr/share/$APP_SHORT_NAME"

APP_BIN_DIRECTORY="/usr/share/$APP_SHORT_NAME/bin"

APP_CONFIG_DIRECTORY="/usr/share/$APP_SHORT_NAME/conf"

commandFilePath="$APP_BIN_DIRECTORY/$APP_SHORT_NAME"

envConfigFilePath="$APP_CONFIG_DIRECTORY/$APP_SHORT_NAME.conf"

source "$envConfigFilePath"

echo "Starting '$APP_NAME' ..."

cd "$APP_BIN_DIRECTORY"

exec /bin/sh -c "$commandFilePath"
