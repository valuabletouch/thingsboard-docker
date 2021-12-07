#!/bin/bash

appName="ThingsBoard COAP Transport Microservice"

appCode="tb-coap-transport"

appMainClass="org.thingsboard.server.coap.ThingsboardCoapTransportApplication"

jarFilePath="/app/bin/$appCode.jar"

logbackFilePath="/app/conf/logback.xml"

cd /app/bin

if [ "$ENABLE_DEBUGGING" = "true" ] || [ "$ENABLE_DEBUGGING" = "1" ]; then
    if [ -z "$DEBUGGER_PORT" ]; then
        DEBUGGER_PORT=47358
    fi

    JAVA_OPTS="$JAVA_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=0.0.0.0:$DEBUGGER_PORT"
fi

echo "Starting '$appName' ..."

exec java -cp \
    "$jarFilePath" \
    $JAVA_OPTS \
    -Dloader.main=$appMainClass \
    -Dspring.jpa.hibernate.ddl-auto=none \
    -Dlogging.config="$logbackFilePath" \
    org.springframework.boot.loader.PropertiesLauncher
