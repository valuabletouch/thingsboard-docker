#!/bin/bash

appName="ThingsBoard Node Microservice"

appCode="thingsboard"

appMainClass="org.thingsboard.server.ThingsboardServerApplication"

installMainClaass="org.thingsboard.server.ThingsboardInstallApplication"

jarFilePath="/app/bin/$appCode.jar"

envConfigFilePath="/app/conf/$appCode.conf"

propConfigFilePath="/app/conf/$appCode.yml"

logConfigFilePath="/app/conf/logback.xml"

source "$envConfigFilePath"

cd /app/bin

if [ "$STARTUP_MODE" == "install" ]; then

    if [ "$LOAD_DEMO_DATA" == "true" ]; then
        loadDemoData=true
    else
        loadDemoData=false
    fi

    echo "Starting '$appName' installation ..."

    exec java -cp \
        "$jarFilePath" \
        $JAVA_OPTS \
        -Dloader.main=$installMainClaass \
        -Dspring.jpa.hibernate.ddl-auto=none \
        -Dinstall.load_demo=$loadDemoData \
        -Dinstall.upgrade=false \
        -Dlogging.config="$logConfigFilePath" \
        org.springframework.boot.loader.PropertiesLauncher 2>&1 || :

elif [ "$STARTUP_MODE" == "upgrade" ]; then

    if [[ -z "${UPGRADE_FROM_VERSION// }" ]]; then
        echo "FROM_VERSION variable is invalid or unspecified!"
        exit 1
    else
        fromVersion="${UPGRADE_FROM_VERSION// }"
    fi

    echo "Starting '$appName' upgrade ..."

    exec java -cp \
        "$jarFilePath" \
        $JAVA_OPTS \
        -Dloader.main=$installMainClaass \
        -Dspring.jpa.hibernate.ddl-auto=none \
        -Dinstall.upgrade=true \
        -Dinstall.upgrade.from_version="$fromVersion" \
        -Dlogging.config="$logConfigFilePath" \
        org.springframework.boot.loader.PropertiesLauncher 2>&1 || :

fi

echo "Starting '$appName' ..."

exec java -cp \
    "$jarFilePath" \
    $JAVA_OPTS \
    -Dloader.main=$appMainClass \
    -Dspring.jpa.hibernate.ddl-auto=none \
    -Dlogging.config="$logConfigFilePath" \
    org.springframework.boot.loader.PropertiesLauncher
