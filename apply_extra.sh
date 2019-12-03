#!/usr/bin/env sh

set -e

ar x gitkraken.deb
tar xf data.tar.xz

install -Dm0644 usr/share/gitkraken/gitkraken.png export/share/icons/hicolor/512x512/apps/com.axosoft.GitKraken.png

desktop_file="export/share/applications/com.axosoft.GitKraken.desktop"
install -Dm0644 usr/share/applications/gitkraken.desktop "$desktop_file"
desktop-file-edit --set-key="Exec" --set-value="gitkraken %U" "$desktop_file"
desktop-file-edit --set-key="Icon" --set-value="com.axosoft.GitKraken" "$desktop_file"
desktop-file-edit --set-key="StartupWMClass" --set-value="gitkraken" "$desktop_file"

mv usr/share/gitkraken gitkraken

rm -rf gitkraken.deb control.tar.gz data.tar.xz debian-binary usr
