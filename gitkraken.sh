#!/usr/bin/env sh

set -e

FLAG_FILE="$XDG_CONFIG_HOME/.zenity_please_ask_for_support"

if [ ! -f "$FLAG_FILE" ]; then
    zenity --info --text='This Flatpak is maintained by volunteers.\nPlease, ask Axosoft to officially support Flatpak.\n\n<a href="https://feedback.gitkraken.com/suggestions/308722/flatpak-installer-on-flathub">Gitkraken Suggestions</a>' --width=400
    touch "$FLAG_FILE"
fi

exec env TMPDIR="$XDG_CACHE_HOME" zypak-wrapper /app/extra/gitkraken/gitkraken "$@"
