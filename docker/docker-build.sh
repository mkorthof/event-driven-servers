#!/bin/bash

# Create runtime image with .deb pkg

#ARGS+=" --build-arg BASE_IMAGE=ubuntu:24.04"
#ARGS+=" --progress=plain "
#ARGS+=" --debug "

if ! find dist/tac-plus-ng*.deb 2>/dev/null; then
    echo "ERROR: .deb package not found, exiting ..."
    exit 1
fi
docker build \
  $ARGS \
  --cache-from tacacs-plus-ng:build \
  --tag tacacs-plus-ng:build \
  --file Dockerfile \
  .
