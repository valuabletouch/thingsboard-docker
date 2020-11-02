#!/bin/bash

APP_NAME="ThingsBoard MQTT Transport Microservice"

APP_SHORT_NAME=tb-mqtt-transport

APP_DIRECTORY=/usr/share/$APP_SHORT_NAME

APP_MAIN_CLASS=org.thingsboard.server.mqtt.ThingsboardMqttTransportApplication

if [[ -z "$CONFIG_DIRECTORY" ]]; then
    CONFIG_DIRECTORY="/config"
fi

if [ ! -d "$CONFIG_DIRECTORY" ]; then
    mkdir -p $CONFIG_DIRECTORY
fi

jarFilePath=$APP_DIRECTORY/bin/$APP_SHORT_NAME.jar

envConfigFilePath=$CONFIG_DIRECTORY/$APP_SHORT_NAME.conf

propConfigFilePath=$CONFIG_DIRECTORY/$APP_SHORT_NAME.yml

logConfigFilePath=$CONFIG_DIRECTORY/logback.xml

if [ ! -f "$envConfigFilePath" ]; then
    cp $APP_DIRECTORY/conf/$APP_SHORT_NAME.conf $envConfigFilePath
fi

if [ ! -f "$propConfigFilePath" ]; then
    cp $APP_DIRECTORY/conf/$APP_SHORT_NAME.yml $propConfigFilePath
fi

if [ ! -f "$logConfigFilePath" ]; then
    cp $APP_DIRECTORY/conf/logback.yml $logConfigFilePath
fi

source "$envConfigFilePath"

export LOADER_PATH=$CONFIG_DIRECTORY,$LOADER_PATH

echo "Starting '$APP_NAME' ..."

cd $APP_DIRECTORY/bin

exec java -cp \
    $jarFilePath \
    $JAVA_OPTS \
    -Dloader.main=$APP_MAIN_CLASS \
    -Dspring.jpa.hibernate.ddl-auto=none \
    -Dlogging.config=$logConfigFilePath \
    org.springframework.boot.loader.PropertiesLauncher
