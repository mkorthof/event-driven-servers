#!/bin/bash

# Runs build.sh and dpkg.sh in docker container using image created by docker-build.sh
# Output to ./dist dir

DOCKER_ARGS+=" --volume ../debian:/debian "
DOCKER_ARGS+=" --volume ../scripts:/scripts "
DOCKER_ARGS+=" --volume ./dist:/dist "

test -d dist || mkdir dist
docker run \
    $DOCKER_ARGS \
    --rm \
    -it \
    tacacs-plus-ng:build \
    sh -c '/scripts/build.sh && cp -v *binaries*.tar.gz /dist; /scripts/dpkg.sh && cp -v *.deb /dist'
