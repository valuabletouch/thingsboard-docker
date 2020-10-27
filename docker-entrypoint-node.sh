#!/bin/bash

CONF_FOLDER="/config"

jarFile=/usr/share/thingsboard/bin/thingsboard.jar
configFile=thingsboard.conf

source "${CONF_FOLDER}/${configFile}"

export LOADER_PATH=${CONF_FOLDER},${LOADER_PATH}

echo "Starting 'ThingsBoard Node Microservice' ..."

cd /usr/share/thingsboard/bin

exec java -cp \
    ${jarFile} \
    $JAVA_OPTS \
    -Dloader.main=org.thingsboard.server.ThingsboardServerApplication \
    -Dspring.jpa.hibernate.ddl-auto=none \
    -Dlogging.config=/config/logback.xml \
    org.springframework.boot.loader.PropertiesLauncher
