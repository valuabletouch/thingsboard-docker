#!/bin/bash

appName="ThingsBoard Node Microservice"

appCode="thingsboard"

jarFilePath="/app/bin/$appCode.jar"

logbackFilePath="/app/conf/logback.xml"

cd /app/bin

if [ "$ENABLE_DEBUGGING" = "true" ] || [ "$ENABLE_DEBUGGING" = "1" ]; then
    if [ -z "$DEBUGGER_PORT" ]; then
        DEBUGGER_PORT=47358
    fi

    JAVA_OPTS="$JAVA_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=0.0.0.0:$DEBUGGER_PORT"
fi

if [ "$STARTUP_MODE" == "install" ]; then

    if [ "$LOAD_DEMO_DATA" == "true" ]; then
        loadDemoData=true
    else
        loadDemoData=false
    fi

    echo "Starting '$appName' installation ..."

    installMainClaass="org.thingsboard.server.ThingsboardInstallApplication"

    exec java -cp \
        "$jarFilePath" \
        $JAVA_OPTS \
        -Dloader.main=$installMainClaass \
        -Dspring.jpa.hibernate.ddl-auto=none \
        -Dinstall.load_demo=$loadDemoData \
        -Dinstall.upgrade=false \
        -Dlogging.config="$logbackFilePath" \
        org.springframework.boot.loader.PropertiesLauncher 2>&1 || :

elif [ "$STARTUP_MODE" == "upgrade" ]; then

    echo "Starting '$appName' upgrade ..."

    upgradeMainClass="org.thingsboard.server.vsensor.upgrade.ThingsboardUpgradeApplication"

    exec java -cp \
        "$jarFilePath" \
        $JAVA_OPTS \
        -Dloader.main=$upgradeMainClass \
        -Dspring.jpa.hibernate.ddl-auto=none \
        -Dupgrade.upgrade=true \
        -Dlogging.config="$logbackFilePath" \
        org.springframework.boot.loader.PropertiesLauncher 2>&1 || :

else

    echo "Starting '$appName' ..."

    appMainClass="org.thingsboard.server.ThingsboardServerApplication"

    exec java -cp \
        "$jarFilePath" \
        $JAVA_OPTS \
        -Dloader.main=$appMainClass \
        -Dspring.jpa.hibernate.ddl-auto=none \
        -Dlogging.config="$logbackFilePath" \
        org.springframework.boot.loader.PropertiesLauncher
fi