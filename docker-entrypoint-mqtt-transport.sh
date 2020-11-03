#!/bin/bash

appName="ThingsBoard MQTT Transport Microservice"

appCode="tb-mqtt-transport"

appMainClass="org.thingsboard.server.mqtt.ThingsboardMqttTransportApplication"

appDir="/usr/share/$appCode"

appBinDir="$appDir/bin"

appConfigDir="$appDir/conf"

jarFilePath="$appBinDir/$appCode.jar"

envConfigFilePath="$appConfigDir/$appCode.conf"

propConfigFilePath="$appConfigDir/$appCode.yml"

logConfigFilePath="$appConfigDir/logback.xml"

source "$envConfigFilePath"

ln -sf /proc/self/fd/1 "/var/log/$appCode/$appCode.log"

echo "Starting '$appName' ..."

cd "$appBinDir"

exec java -cp \
    "$jarFilePath" \
    $JAVA_OPTS \
    -Dloader.main=$appMainClass \
    -Dspring.jpa.hibernate.ddl-auto=none \
    -Dlogging.config="$logConfigFilePath" \
    org.springframework.boot.loader.PropertiesLauncher
