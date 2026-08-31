#!/usr/bin/env bash
set -euo pipefail

VERSION="${VERSION:-1.0-dev001}"
ARCH="${ARCH:-amd64}"
DIST="${DIST:-trixie}"
IMAGE_NAME="tr-linux-${VERSION}-${ARCH}"

require_cmd() {
  command -v "$1" >/dev/null 2>&1 || { echo "Missing required command: $1" >&2; exit 1; }
}

for cmd in lb sha256sum; do
  require_cmd "$cmd"
done

if [[ "${EUID}" -ne 0 ]]; then
  echo "Run this script as root (sudo ./build.sh)." >&2
  exit 1
fi

find config/hooks -type f -name '*.hook.chroot' -exec chmod 0755 {} + 2>/dev/null || true

lb clean --purge || true

lb config noauto \
  --mode debian \
  --distribution "$DIST" \
  --architectures "$ARCH" \
  --binary-images iso-hybrid \
  --archive-areas "main contrib non-free non-free-firmware" \
  --debian-installer none \
  --apt-recommends true \
  --bootappend-live "boot=live components quiet splash username=live hostname=tr-linux" \
  --iso-application "TR Linux" \
  --iso-publisher "TechRefreshing" \
  --iso-volume "TR_LINUX_1_0"

lb build 2>&1 | tee build.log

ISO="live-image-${ARCH}.hybrid.iso"
if [[ ! -f "$ISO" ]]; then
  echo "Expected ISO not found: $ISO" >&2
  exit 1
fi

mv "$ISO" "${IMAGE_NAME}.iso"
sha256sum "${IMAGE_NAME}.iso" > "${IMAGE_NAME}.iso.sha256"

echo "Built ${IMAGE_NAME}.iso"
