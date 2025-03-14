#!/bin/bash

appName="ThingsBoard COAP Transport Microservice"

appCode="tb-coap-transport"

appMainClass="org.thingsboard.server.coap.ThingsboardCoapTransportApplication"

jarFilePath="/app/bin/$appCode.jar"

logbackFilePath="/app/conf/logback.xml"

cd /app/bin

if [ "$ENABLE_REMOTE_JMX" = "true" ]; then
    if [ -z "$REMOTE_JMX_PORT" ]; then
        REMOTE_JMX_PORT=49090
    fi

    if [ -z "$REMOTE_JMX_HOST" ]; then
        REMOTE_JMX_HOST=0.0.0.0
    fi

    JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote=true"
    JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.authenticate=false"
    JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.ssl=false"
    JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.local.only=false"
    JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.port=$REMOTE_JMX_PORT"
    JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.rmi.port=$REMOTE_JMX_PORT"
    JAVA_OPTS="$JAVA_OPTS -Djava.rmi.server.hostname=$REMOTE_JMX_HOST"
fi

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
    -Dlogging.config="$logbackFilePath" \
    org.springframework.boot.loader.launch.PropertiesLauncher
