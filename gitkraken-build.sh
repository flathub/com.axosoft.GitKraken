#!/usr/bin/env sh

set -eux

install -Dm0755 apply_extra.sh ${FLATPAK_DEST}/bin/apply_extra
install -Dm0755 gitkraken.sh ${FLATPAK_DEST}/bin/gitkraken
install -Dm0644 ${FLATPAK_ID}.metainfo.xml ${FLATPAK_DEST}/share/appdata/${FLATPAK_ID}.metainfo.xml

ar p gitkraken.deb data.tar.xz | tar -xJf -

install -Dm0644 usr/share/applications/gitkraken.desktop ${FLATPAK_DEST}/share/applications/${FLATPAK_ID}.desktop
desktop-file-edit --set-key="Exec" --set-value="gitkraken %U" ${FLATPAK_DEST}/share/applications/${FLATPAK_ID}.desktop
desktop-file-edit --set-key="Icon" --set-value=${FLATPAK_ID} ${FLATPAK_DEST}/share/applications/${FLATPAK_ID}.desktop

install -Dm0644 usr/share/applications/gitkraken-url-handler.desktop ${FLATPAK_DEST}/share/applications/${FLATPAK_ID}.UrlHandler.desktop
desktop-file-edit --set-key="Exec" --set-value="gitkraken --uri %U" ${FLATPAK_DEST}/share/applications/${FLATPAK_ID}.UrlHandler.desktop
desktop-file-edit --set-key="Icon" --set-value=${FLATPAK_ID} ${FLATPAK_DEST}/share/applications/${FLATPAK_ID}.UrlHandler.desktop

for size in 64 128 264 512; do
    convert usr/share/gitkraken/gitkraken.png -resize ${size} ${FLATPAK_ID}.png
    install -Dm0644 ${FLATPAK_ID}.png ${FLATPAK_DEST}/share/icons/hicolor/${size}x${size}/apps/${FLATPAK_ID}.png
done
