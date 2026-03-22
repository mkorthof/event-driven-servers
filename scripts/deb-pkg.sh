#!/bin/sh -x

# Create 'unofficial' local .deb package

TACPLUSNG_DIR=tac-plus-ng
SCRIPTDIR="$(realpath "$(dirname "$0")")"
# shellcheck disable=SC1091
. "${SCRIPTDIR}/src.sh"
# shellcheck disable=SC1091
. "${SCRIPTDIR}/version.sh"
cd "$SRCDIR" || exit 1
# create pkg dir
TACPLUSNG_PKG_DIR="${TACPLUSNG_DIR}-${DEB_VERSION}"
test -d "$TACPLUSNG_PKG_DIR" && \
    { echo "ERROR: pkg dir already exists $TACPLUSNG_PKG_DIR"; exit 1; }
mkdir "$TACPLUSNG_PKG_DIR"    
for i in *; do
    if [ "$i" != "$TACPLUSNG_PKG_DIR" ]; then
        cp -r "$i" "$TACPLUSNG_PKG_DIR"
    fi
done
cd "$TACPLUSNG_PKG_DIR" || exit 1
# generate debian/* files
rm -r debian
make distclean
LOGNAME=nobody dh_make -y -s --createorig
# create .deb
dpkg-buildpackage -b -rfakeroot --rules-file="${SCRIPTDIR}/../debian/rules"
