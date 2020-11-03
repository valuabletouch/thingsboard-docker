#!/bin/bash

appName="ThingsBoard Web UI Microservice"

appCode="tb-web-ui"

appDir="/usr/share/$appCode"

appBinDir="$appDir/bin"

appConfigDir="$appDir/conf"

commandFilePath="$appBinDir/$appCode"

envConfigFilePath="$appConfigDir/$appCode.conf"

source "$envConfigFilePath"

echo "Starting '$appName' ..."

cd "$appBinDir"

exec /bin/sh -c "$commandFilePath"
