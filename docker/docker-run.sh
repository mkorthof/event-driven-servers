#!/bin/bash

# Runs tac_plus-ng in container using image created by docker-build.sh

if [ ! -s tac_plus-ng.cfg ]; then
    echo "ERROR: tac_plus-ng.cfg not found, exiting ..."
    exit 1
fi
docker run $DOCKER_ARGS \
    --rm \
    --name tac-plus-ng \
    --detach \
    --publish 49:49/tcp \
    --publish 49:49/udp \
    --volume ./tac_plus-ng.cfg:/usr/local/etc/tac_plus-ng.cfg \
    tacacs-plus-ng:latest
