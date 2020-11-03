#!/bin/bash

appName="ThingsBoard HTTP Transport Microservice"

appCode="tb-http-transport"

appMainClass="org.thingsboard.server.http.ThingsboardHttpTransportApplication"

appDir="/usr/share/$appCode"

appBinDir="$appDir/bin"

appConfigDir="$appDir/conf"

jarFilePath="$appBinDir/$appCode.jar"

envConfigFilePath="$appConfigDir/$appCode.conf"

propConfigFilePath="$appConfigDir/$appCode.yml"

logConfigFilePath="$appConfigDir/logback.xml"

source "$envConfigFilePath"

echo "Starting '$appName' ..."

cd "$appBinDir"

exec java -cp \
    "$jarFilePath" \
    $JAVA_OPTS \
    -Dloader.main=$appMainClass \
    -Dspring.jpa.hibernate.ddl-auto=none \
    -Dlogging.config="$logConfigFilePath" \
    org.springframework.boot.loader.PropertiesLauncher
