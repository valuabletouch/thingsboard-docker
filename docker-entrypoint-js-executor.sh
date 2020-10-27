#!/bin/bash

CONF_FOLDER="/usr/share/tb-js-executor/conf"

commandFile=/usr/share/tb-js-executor/bin/tb-js-executor
configFile=tb-js-executor.conf

source "${CONF_FOLDER}/${configFile}"

echo "Starting 'ThingsBoard JavaScript Executor Microservice' ..."

cd /usr/share/tb-js-executor/bin

exec /bin/sh -c "$commandFile"
