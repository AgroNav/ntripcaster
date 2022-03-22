#!/bin/bash

HOSTPORT=8000
CONTAINERPORT=8000
NTRIP_CONF_DIR="agronav_ntripcaster_conf"

cd ./$NTRIP_CONF_DIR || { echo "ERROR: run $0 in ntripcaster software home dir..."; exit 1; }

docker run -dp $HOSTPORT:$CONTAINERPORT --restart always -v "$(pwd):/usr/local/ntripcaster/conf" ntripcaster

cd -