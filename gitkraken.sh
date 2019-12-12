#!/usr/bin/env sh

set -e

exec env TMPDIR=$XDG_CACHE_HOME /app/extra/gitkraken/gitkraken "$@"
