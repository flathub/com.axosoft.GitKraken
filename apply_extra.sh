#!/usr/bin/env sh

set -e

ar p gitkraken.deb data.tar.xz | tar -xJf -

mv usr/share/gitkraken gitkraken

rm -rf gitkraken.deb usr
