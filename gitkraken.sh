#!/usr/bin/env sh

set -e

FLAG_FILE="$XDG_CONFIG_HOME/.zenity_please_ask_for_support"

if [ ! -f "$FLAG_FILE" ]; then
    zenity --info --text='Please, ask Axosoft to officially support Flatpak. With recent upstream changes, this package has become far less reliable. \n\n <a href="https://feedback.gitkraken.com/suggestions/308722/flatpak-installer-on-flathub">Gitkraken Suggestions</a>'
    touch "$FLAG_FILE"
fi

exec env TMPDIR="$XDG_CACHE_HOME" zypak-wrapper /app/extra/gitkraken/gitkraken "$@"
