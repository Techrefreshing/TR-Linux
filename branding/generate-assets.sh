#!/usr/bin/env bash
set -euo pipefail
OUT="${1:-branding/generated}"
mkdir -p "$OUT"
command -v rsvg-convert >/dev/null 2>&1 || { echo "rsvg-convert is required (librsvg2-bin)." >&2; exit 1; }

render() {
  local src="$1" dst="$2" w="$3" h="$4"
  rsvg-convert -w "$w" -h "$h" "$src" -o "$dst"
}

render branding/logo.svg "$OUT/tr-monogram.png" 512 512
render branding/logo.svg "$OUT/tr-wordmark.png" 512 512
render branding/install-icon.svg "$OUT/install-tr-linux.png" 512 512
render branding/wallpaper.svg "$OUT/wallpaper-3840x2160.png" 3840 2160
render branding/sddm-background.svg "$OUT/sddm-background.png" 2560 1440
render branding/boot-background.svg "$OUT/grub-background.png" 1920 1080
render branding/boot-background.svg "$OUT/isolinux-splash.png" 640 480
render branding/calamares-welcome.svg "$OUT/calamares-welcome.png" 800 320
render branding/calamares-slide1.svg "$OUT/calamares-slide1.png" 960 540
render branding/plymouth-logo.svg "$OUT/plymouth-logo.png" 900 300
