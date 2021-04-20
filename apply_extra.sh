#!/usr/bin/env sh

set -e

bsdtar -Oxf gitkraken.deb 'data.tar.*' |
  bsdtar -xf - \
    --strip-components=3 \
    --exclude='./usr/bin/' \
    --exclude='./usr/share/applications/' \
    --exclude='./usr/share/doc/' \
    --exclude='./usr/share/lintian/' \
    --exclude='./usr/share/pixmaps/'

rm -rf gitkraken.deb
