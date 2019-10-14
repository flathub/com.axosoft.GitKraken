#!/usr/bin/env bash

set -e

exec env TMPDIR=$XDG_CACHE_HOME /app/extra/gitkraken/gitkraken "$@"
