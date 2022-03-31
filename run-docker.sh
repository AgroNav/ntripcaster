#!/bin/bash

HOSTPORT=8000
CONTAINERPORT=8000
NTRIP_CONF_DIR="agronav_ntripcaster_conf"
RESTART_ALWAYS=

print_help() {
    echo "Usage: $0 [-p <host_port>] [-r] [-h]"
    echo " -r   Always restarts the container if it stops (see 'Docker restart policy')"
    echo " -p   Specify host port (default: 8000)"
    echo " -h   Print this help"
}

while getopts "p:hr" o; do
    case "${o}" in
        p)
            HOSTPORT=${OPTARG}
            ;;
        r)
            RESTART_ALWAYS="--restart always"
            ;;
        h)
            print_help
            exit 0
            ;;
        *)
            print_help
            exit 1
            ;;
    esac
done

cd ./$NTRIP_CONF_DIR || { echo "ERROR: run $0 in ntripcaster software home dir..."; exit 1; }

docker run -dp "$HOSTPORT":$CONTAINERPORT ${RESTART_ALWAYS} -v "$(pwd):/usr/local/ntripcaster/conf" ntripcaster

cd - || exit