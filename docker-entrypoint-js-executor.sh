#!/bin/bash

appName="ThingsBoard JavaScript Executor Microservice"

appCode="tb-js-executor"

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
