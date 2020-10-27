#!/bin/bash

CONF_FOLDER="/config"

jarFile=/usr/share/tb-mqtt-transport/bin/tb-mqtt-transport.jar
configFile=tb-mqtt-transport.conf

source "${CONF_FOLDER}/${configFile}"

export LOADER_PATH=${CONF_FOLDER},${LOADER_PATH}

echo "Starting 'ThingsBoard MQTT Transport Microservice' ..."

cd /usr/share/tb-mqtt-transport/bin

exec java -cp \
    ${jarFile} \
    $JAVA_OPTS \
    -Dloader.main=org.thingsboard.server.mqtt.ThingsboardMqttTransportApplication \
    -Dspring.jpa.hibernate.ddl-auto=none \
    -Dlogging.config=/config/logback.xml \
    org.springframework.boot.loader.PropertiesLauncher
