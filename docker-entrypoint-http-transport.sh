#!/bin/bash

appName="ThingsBoard HTTP Transport Microservice"

appCode="tb-http-transport"

appMainClass="org.thingsboard.server.http.ThingsboardHttpTransportApplication"

jarFilePath="/app/bin/$appCode.jar"

logbackFilePath="/app/conf/logback.xml"

cd /app/bin

echo "Starting '$appName' ..."

exec java -cp \
    "$jarFilePath" \
    $JAVA_OPTS \
    -Dloader.main=$appMainClass \
    -Dspring.jpa.hibernate.ddl-auto=none \
    -Dlogging.config="$logbackFilePath" \
    org.springframework.boot.loader.PropertiesLauncher
