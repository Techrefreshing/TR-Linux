#!/usr/bin/env bash
# Copyright © 2026 TechRefreshing
# SPDX-License-Identifier: GPL-3.0-only
set -euo pipefail

VERSION="${VERSION:-1.0}"
ARCH="${ARCH:-amd64}"
DIST="${DIST:-trixie}"
IMAGE_BASE="tr-linux-${VERSION}"
IMAGE_NAME="${IMAGE_BASE}-${ARCH}"

require_cmd() {
  command -v "$1" >/dev/null 2>&1 || { echo "Missing required command: $1" >&2; exit 1; }
}

for cmd in lb sha256sum install cp rsvg-convert; do
  require_cmd "$cmd"
done

if [[ "${EUID}" -ne 0 ]]; then
  echo "Run this script as root (sudo ./build.sh)." >&2
  exit 1
fi

bash branding/generate-assets.sh branding/generated

for asset in \
  tr-monogram.png tr-wordmark.png install-tr-linux.png \
  wallpaper-3840x2160.png sddm-background.png \
  isolinux-splash.png grub-background.png \
  calamares-welcome.png calamares-slide1.png plymouth-logo.png \
  plymouth-star.png plymouth-dot.png grub-select.png; do
  if [[ ! -f "branding/generated/${asset}" ]]; then
    echo "Missing generated branding asset: branding/generated/${asset}" >&2
    exit 1
  fi
done

# Publish project, legal, support, and release documents inside the live and
# installed systems. Keeping one canonical copy in the repository prevents the
# ISO notices from drifting away from the public source.
DOC_DEST="config/includes.chroot/usr/share/doc/tr-linux"
rm -rf "$DOC_DEST"
install -d "$DOC_DEST"
for document in LICENSE COPYRIGHT BRANDING-LICENSE.md THIRD-PARTY-NOTICES.md DEBIAN-ATTRIBUTION.md SOURCE-CODE.md TRADEMARKS.md DISCLAIMER.md PRIVACY.md SECURITY.md RELEASE-NOTES.md SUPPORT.md KNOWN-ISSUES.md RELEASE-CHECKLIST.md; do
  install -m 0644 "$document" "$DOC_DEST/$document"
done

# Make approved branding available inside the live root filesystem.
rm -rf config/includes.chroot/usr/share/tr-linux/branding
install -d config/includes.chroot/usr/share/tr-linux/branding
cp -a branding/generated/. config/includes.chroot/usr/share/tr-linux/branding/
install -m 0644 branding/wallpaper.svg config/includes.chroot/usr/share/tr-linux/branding/wallpaper.svg

chmod 0755 config/includes.chroot/usr/local/bin/tr-linux-welcome config/includes.chroot/usr/local/bin/tr-linux-welcome-first-run config/includes.chroot/usr/local/bin/tr-linux-session-setup config/includes.chroot/usr/local/sbin/tr-linux-finalize-target config/includes.chroot/usr/local/bin/tr-linux-diagnostics config/includes.chroot/usr/local/bin/tr-linux-hardware-check config/includes.chroot/usr/local/bin/tr-linux-reset-desktop

find config/hooks -type f \( -name '*.hook.chroot' -o -name '*.hook.binary' \) -exec chmod 0755 {} + 2>/dev/null || true

lb clean --purge || true
rm -f config/{binary,bootstrap,chroot,common,source} 2>/dev/null || true

lb config noauto \
  --mode debian \
  --distribution "$DIST" \
  --architectures "$ARCH" \
  --binary-images iso-hybrid \
  --archive-areas "main contrib non-free non-free-firmware" \
  --debian-installer none \
  --apt-recommends true \
  --memtest none \
  --image-name "$IMAGE_BASE" \
  --bootappend-live "boot=live components quiet splash username=trlinux hostname=tr-linux" \
  --iso-application "TechRefreshing Linux 1.0" \
  --iso-preparer "TechRefreshing" \
  --iso-publisher "TechRefreshing; https://techrefreshing.com/" \
  --iso-volume "TR_LINUX_1_0"

lb build 2>&1 | tee build.log

ISO="${IMAGE_NAME}.hybrid.iso"
if [[ ! -f "$ISO" ]]; then
  ISO="${IMAGE_BASE}.hybrid.iso"
fi
if [[ ! -f "$ISO" ]]; then
  ISO="live-image-${ARCH}.hybrid.iso"
fi
if [[ ! -f "$ISO" ]]; then
  echo "Expected ISO not found." >&2
  ls -lah *.iso 2>/dev/null || true
  exit 1
fi

FINAL="${IMAGE_NAME}.iso"
if [[ "$ISO" != "$FINAL" ]]; then
  mv "$ISO" "$FINAL"
fi
sha256sum "$FINAL" > "${FINAL}.sha256"

echo "Built ${FINAL}"
