#!/bin/bash

appName="ThingsBoard Web UI Microservice"

appCode="tb-web-ui"

commandFilePath="/app/bin/$appCode"

envConfigFilePath="/app/conf/$appCode.conf"

source "$envConfigFilePath"

cd /app/bin

echo "Starting '$appName' ..."

exec /bin/sh -c "$commandFilePath"
