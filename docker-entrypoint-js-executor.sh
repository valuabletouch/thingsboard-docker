#!/bin/bash

appName="ThingsBoard JavaScript Executor Microservice"

appCode="tb-js-executor"

commandFilePath="/app/bin/$appCode"

envConfigFilePath="/app/conf/$appCode.conf"

source "$envConfigFilePath"

cd /app/bin

echo "Starting '$appName' ..."

exec /bin/sh -c "$commandFilePath"
