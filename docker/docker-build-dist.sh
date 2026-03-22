#!/bin/bash

# Create build image for compiling and packaging

#ARGS+=" --build-arg BASE_IMAGE=ubuntu:24.04"
#ARGS+=" --progress=plain "
#ARGS+=" --debug "

docker build \
  $ARGS \
  --cache-from tacacs-plus-ng:dist \
  --tag tacacs-plus-ng:dist \
  --file Dockerfile.dist \
  .
