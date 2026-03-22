#!/bin/sh

# Make sure source is available from git or download tarball

TARGZ_URL="https://github.com/MarcJHuber/event-driven-servers/archive/refs/heads/master.tar.gz"
if grep -Eqs 'event-driven-servers' .git/config; then
    SRCDIR="."
else
    curl -sSL -O "$TARGZ_URL" && \
        tar xvf master.tar.gz
    SRCDIR="event-driven-servers-master"
fi
export SRCDIR
