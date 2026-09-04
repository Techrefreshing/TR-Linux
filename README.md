# TechRefreshing Linux

TR Linux is a Debian Stable–based KDE Plasma desktop distribution developed by TechRefreshing.

This repository contains the reproducible ISO build configuration for
TechRefreshing Linux 1.0: Debian 13 Stable, KDE Plasma 6, Calamares, Flatpak,
and complete TechRefreshing desktop and boot branding.

Created by **Anup Kumar Yadav**.

- Website: https://techrefreshing.com/tr-linux/
- Linux guides: https://linuxano.com/
- Release notes: [RELEASE-NOTES.md](RELEASE-NOTES.md)
- Known issues: [KNOWN-ISSUES.md](KNOWN-ISSUES.md)
- Support: [SUPPORT.md](SUPPORT.md)
- Privacy: [PRIVACY.md](PRIVACY.md)
- Security: [SECURITY.md](SECURITY.md)
- Source availability: [SOURCE-CODE.md](SOURCE-CODE.md)
- Third-party notices: [THIRD-PARTY-NOTICES.md](THIRD-PARTY-NOTICES.md)
- Debian attribution: [DEBIAN-ATTRIBUTION.md](DEBIAN-ATTRIBUTION.md)
- Trademark policy: [TRADEMARKS.md](TRADEMARKS.md)
- Warranty disclaimer: [DISCLAIMER.md](DISCLAIMER.md)

## Download

Open **Actions**, select the newest successful **Build TR Linux ISO** run, and
download the `tr-linux-1.0-amd64` artifact. The download contains the
bootable ISO, SHA-256 checksum, build log, and validation report.

Verify it before writing it to USB:

```sh
sha256sum -c tr-linux-1.0-amd64.iso.sha256
```

## Build locally

On a clean Debian 13 amd64 system with at least 30 GB free space:

```sh
sudo apt update
sudo apt install live-build debootstrap squashfs-tools xorriso isolinux \
  syslinux-common grub-pc-bin grub-efi-amd64-bin mtools dosfstools \
  ca-certificates curl wget gnupg librsvg2-bin
sudo ./build.sh
```

## Licensing

Build scripts and distribution configuration are licensed under GPL-3.0-only;
see [LICENSE](LICENSE). TechRefreshing names, logos, wallpapers, and original
visual assets use the separate [branding licence](BRANDING-LICENSE.md).
Third-party packages remain under their respective licences.

> Status: development build. Do not use on production systems until a release is explicitly marked stable.

The live session uses the display name **TechRefreshing Live User**, username
`trlinux`, fallback password `live`, and hostname `tr-linux`. Automatic
login is enabled, and locking/sleep are disabled only in the temporary live
session so an unattended installation is not interrupted. The desktop supplies
a TR-branded first-run control centre, a slim top bar, and a centred floating
application dock.

The installed system applies a TechRefreshing GRUB theme, animated Plymouth
splash, TR user avatar, and post-install identity finalizer. The Control Centre
also provides hardware readiness checks, privacy-filtered diagnostics, package
and boot repair, Timeshift restore points, and four curated Plasma layouts.
