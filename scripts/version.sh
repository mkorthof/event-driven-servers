#!/bin/sh -x    

DATE="$( date +%Y%m%d )"
VERSION="$DATE"
DEB_VERSION="$DATE"
if [ -n "$CI" ]; then
    if [ -n "$CI_COMMIT_SHORT_SHA" ]; then
        SHA="$( echo "$GITHUB_SHA" | cut -c1-7)"
    fi
    # gitlab
    if [ -n "$CI_COMMIT_SHORT_SHA" ]; then
        SHA=$CI_COMMIT_SHORT_SHA
    fi
fi
if [ -s "./${SRCDIR}/LAST_COMMIT" ]; then
    LAST_COMMIT="$( head -1 "./${SRCDIR}/LAST_COMMIT" )"
    SHA="$( echo "$LAST_COMMIT" | cut -c1-7)"
fi

if [ -n "$SHA" ]; then
    VERSION="$SHA"
    DEB_VERSION="0+git${DATE}.${SHA}"
fi
export VERSION
export DEB_VERSION
