#!/bin/bash

CONF_FOLDER="/config"

jarFile=/usr/share/tb-http-transport/bin/tb-http-transport.jar
configFile=tb-http-transport.conf

source "${CONF_FOLDER}/${configFile}"

export LOADER_PATH=${CONF_FOLDER},${LOADER_PATH}

echo "Starting 'ThingsBoard HTTP Transport Microservice' ..."

cd /usr/share/tb-http-transport/bin

exec java -cp \
    ${jarFile} \
    $JAVA_OPTS \
    -Dloader.main=org.thingsboard.server.http.ThingsboardHttpTransportApplication \
    -Dspring.jpa.hibernate.ddl-auto=none \
    -Dlogging.config=/config/logback.xml \
    org.springframework.boot.loader.PropertiesLauncher
