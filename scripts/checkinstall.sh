#!/bin/bash -x

# Alternative pkg method

# change to -R for rpm (untested)
ARGS+=" -D "
SCRIPTDIR="$(realpath "$(dirname "$0")")"
# shellcheck disable=SC1091
. "${SCRIPTDIR}/src.sh"
# shellcheck disable=SC1091
. "${SCRIPTDIR}/version.sh"
./configure
make
make install
cat <<EOF >description-pak
  TAC_PLUS-NG    
  .
  tac_plus-ng implements both TACACS+ (TCP, TLS) and RADIUS (UDP, TCP, DTLS, TLS),
  with RADIUS support for PAP/CHAP/MSCHAPv1/MSCHAPv2 authentication and Downloadable ACLs.
EOF
echo | sudo checkinstall \
  $ARGS \
  --install=no \
  --pkgversion="${DEB_VERSION}" \
  --pkgname="tac-plus-ng" \
  --maintainer="nobody@unknown" \
  --pkglicense="BSD" \
  --pkgsource "https://projects.pro-bono-pubtarlico.de/event-driven-servers" \
  --pkgaltsource "https://github.com/MarcJHuber/event-driven-servers" \
