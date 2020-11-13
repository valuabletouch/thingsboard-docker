#!/bin/bash

appName="ThingsBoard COAP Transport Microservice"

appCode="tb-coap-transport"

appMainClass="org.thingsboard.server.coap.ThingsboardCoapTransportApplication"

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
