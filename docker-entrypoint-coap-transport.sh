#!/bin/bash

CONF_FOLDER="/config"

jarFile=/usr/share/tb-coap-transport/bin/tb-coap-transport.jar
configFile=tb-coap-transport.conf

source "${CONF_FOLDER}/${configFile}"

export LOADER_PATH=${CONF_FOLDER},${LOADER_PATH}

echo "Starting 'ThingsBoard COAP Transport Microservice' ..."

cd /usr/share/tb-coap-transport/bin

exec java -cp \
    ${jarFile} \
    $JAVA_OPTS \
    -Dloader.main=org.thingsboard.server.coap.ThingsboardCoapTransportApplication \
    -Dspring.jpa.hibernate.ddl-auto=none \
    -Dlogging.config=/config/logback.xml \
    org.springframework.boot.loader.PropertiesLauncher
