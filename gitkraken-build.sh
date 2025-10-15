#!/usr/bin/env sh

set -eux

install -Dm0755 apply_extra.sh "${FLATPAK_DEST}/bin/apply_extra"
install -Dm0755 gitkraken.sh "${FLATPAK_DEST}/bin/gitkraken"
install -Dm0644 "${FLATPAK_ID}.metainfo.xml" "${FLATPAK_DEST}/share/metainfo/${FLATPAK_ID}.metainfo.xml"

bsdtar -Oxf gitkraken.deb 'data.tar.*' |
  bsdtar -xf - \
    --strip-components=3 \
    --exclude='./usr/bin/' \
    --exclude='./usr/share/doc/' \
    --exclude='./usr/share/gitkraken/' \
    --exclude='./usr/share/lintian/' \

install -Dm0644 applications/gitkraken.desktop "${FLATPAK_DEST}/share/applications/${FLATPAK_ID}.desktop"
desktop-file-edit --set-key="Exec" --set-value="gitkraken %U" "${FLATPAK_DEST}/share/applications/${FLATPAK_ID}.desktop"
desktop-file-edit --set-key="Icon" --set-value="${FLATPAK_ID}" "${FLATPAK_DEST}/share/applications/${FLATPAK_ID}.desktop"

install -Dm0644 applications/gitkraken-url-handler.desktop "${FLATPAK_DEST}/share/applications/${FLATPAK_ID}.UrlHandler.desktop"
desktop-file-edit --set-key="Exec" --set-value="gitkraken --uri %U" "${FLATPAK_DEST}/share/applications/${FLATPAK_ID}.UrlHandler.desktop"
desktop-file-edit --set-key="Icon" --set-value="${FLATPAK_ID}" "${FLATPAK_DEST}/share/applications/${FLATPAK_ID}.UrlHandler.desktop"

for size in 64 128 264 512; do
    convert pixmaps/gitkraken.png -resize "${size}" "${FLATPAK_ID}.png"
    install -Dm0644 "${FLATPAK_ID}.png" "${FLATPAK_DEST}/share/icons/hicolor/${size}x${size}/apps/${FLATPAK_ID}.png"
done

mkdir -p "${FLATPAK_DEST}/plugin/bin"