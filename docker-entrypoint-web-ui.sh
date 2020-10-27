#!/bin/bash

CONF_FOLDER="/usr/share/tb-web-ui/conf"

commandFile=/usr/share/tb-web-ui/bin/tb-js-executor
configFile=tb-js-executor.conf

source "${CONF_FOLDER}/${configFile}"

echo "Starting 'ThingsBoard Web UI Microservice' ..."

cd /usr/share/tb-web-ui/bin

exec /bin/sh -c "$commandFile"
