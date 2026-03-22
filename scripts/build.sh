#!/bin/sh -x

# Build and tar binaries

TACPLUSNG_DIR=tac-plus-ng
SCRIPTDIR="$(realpath "$(dirname "$0")")"
# shellcheck disable=SC1091
. "${SCRIPTDIR}/src.sh"
# shellcheck disable=SC1091
. "${SCRIPTDIR}/version.sh"
cd "$SRCDIR" || exit 1
make distclean && ./configure tac_plus-ng && \
  make && \
  tar zcvf "../${TACPLUSNG_DIR}-binaries-${VERSION}.tar.gz" --exclude=*.o build/*/fakeroot
