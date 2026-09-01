# TechRefreshing Linux

TR Linux is a Debian Stable–based KDE Plasma desktop distribution developed by TechRefreshing.

This repository contains the reproducible ISO build configuration for
TechRefreshing Linux 1.0: Debian 13 Stable, KDE Plasma 6, Calamares, Flatpak,
and complete TechRefreshing desktop and boot branding.

## Download

Open **Actions**, select the newest successful **Build TR Linux ISO** run, and
download the `tr-linux-1.0-dev002-amd64` artifact. The download contains the
bootable ISO, SHA-256 checksum, build log, and validation report.

Verify it before writing it to USB:

```sh
sha256sum -c tr-linux-1.0-dev002-amd64.iso.sha256
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

> Status: development build. Do not use on production systems until a release is explicitly marked stable.
