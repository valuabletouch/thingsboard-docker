#!/bin/bash

appName="ThingsBoard COAP Transport Microservice"

appCode="tb-coap-transport"

appMainClass="org.thingsboard.server.coap.ThingsboardCoapTransportApplication"

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
