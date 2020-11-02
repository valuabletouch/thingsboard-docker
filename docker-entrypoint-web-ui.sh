#!/bin/bash

APP_NAME="ThingsBoard Web UI Microservice"

APP_SHORT_NAME=tb-web-ui

APP_DIRECTORY=/usr/share/$APP_SHORT_NAME

CONFIG_DIRECTORY=$APP_DIRECTORY/conf

commandFilePath=$APP_DIRECTORY/bin/$APP_SHORT_NAME

envConfigFilePath=$CONFIG_DIRECTORY/$APP_SHORT_NAME.conf

source "$envConfigFilePath"

echo "Starting '$APP_NAME' ..."

cd $APP_DIRECTORY/bin

exec /bin/sh -c "$commandFilePath"
