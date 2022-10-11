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

chmod 0755 gitkraken/chrome_crashpad_handler

rm -rf gitkraken.deb
