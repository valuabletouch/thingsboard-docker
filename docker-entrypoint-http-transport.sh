#!/bin/bash

appName="ThingsBoard HTTP Transport Microservice"

appCode="tb-http-transport"

appMainClass="org.thingsboard.server.http.ThingsboardHttpTransportApplication"

jarFilePath="/app/bin/$appCode.jar"

envConfigFilePath="/app/conf/$appCode.conf"

propConfigFilePath="/app/conf/$appCode.yml"

logConfigFilePath="/app/conf/logback.xml"

source "$envConfigFilePath"

cd /app/bin

echo "Starting '$appName' ..."

exec java -cp \
    "$jarFilePath" \
    $JAVA_OPTS \
    -Dloader.main=$appMainClass \
    -Dspring.jpa.hibernate.ddl-auto=none \
    -Dlogging.config="$logConfigFilePath" \
    org.springframework.boot.loader.PropertiesLauncher
