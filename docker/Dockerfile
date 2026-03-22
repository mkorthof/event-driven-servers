ARG BASE_IMAGE="ubuntu:latest"
# hadolint ignore=DL3006
FROM ${BASE_IMAGE}
LABEL org.opencontainers.image.source="https://github.com/MarcJHuber/event-driven-servers"
LABEL org.opencontainers.image.description="TAC_PLUS-NG container image"
LABEL org.opencontainers.image.licenses="Copyright (C) 1996-2022 Marc Huber <Marc.Huber@web.de>"
COPY dist/tac-plus-ng*.deb /
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get --no-install-recommends -yq install  \
        /tac-plus-ng*.deb \
        libcurl4t64 \
        libcares2 && \
    rm -rf /tac-plus-ng*.deb && \
    rm -rf /var/lib/apt/lists/* 
ENTRYPOINT ["/usr/local/sbin/tac_plus-ng", "-d", "1", "-f", "/usr/local/etc/tac_plus-ng.cfg"]
