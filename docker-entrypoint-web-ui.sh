#!/bin/bash

appName="ThingsBoard Web UI Microservice"

appCode="tb-web-ui"

appDir="/usr/share/$appCode"

appBinDir="$appDir/bin"

appConfigDir="$appDir/conf"

commandFilePath="$appBinDir/$appCode"

envConfigFilePath="$appConfigDir/$appCode.conf"

source "$envConfigFilePath"

ln -sf /proc/self/fd/1 "/var/log/$appCode/$appCode.log"

echo "Starting '$appName' ..."

cd "$appBinDir"

exec /bin/sh -c "$commandFilePath"
