#!/bin/bash

appName="ThingsBoard MQTT Transport Microservice"

appCode="tb-mqtt-transport"

appMainClass="org.thingsboard.server.mqtt.ThingsboardMqttTransportApplication"

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
