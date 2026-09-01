# Known issues

This document covers TechRefreshing Linux 1.0. Check GitHub for newer reports.

- The ISO is currently built for 64-bit x86 (amd64) PCs only.
- NVIDIA and other proprietary graphics drivers are not preinstalled. Some
  systems may need safe graphics mode for the live session.
- Secure Boot behaviour depends on firmware, boot mode, and the Debian-signed
  boot chain. Test the target hardware before changing existing installations.
- The live session is not persistent unless the USB was separately configured
  for persistence.
- The installer may reject passwords that fail its dictionary or strength
  checks.
- Very small displays may require resizing or maximising the installer.
- Some Wi-Fi, Bluetooth, fingerprint, webcam, or audio devices may require
  newer firmware or kernels than Debian Stable provides.
- Flatpak applications consume additional disk space after installation.
- Dual-boot installation can be affected by Windows Fast Startup, BitLocker,
  existing RAID, or unusual partition layouts. Back up recovery keys and data.

Report reproducible TR Linux-specific issues at:
https://github.com/Techrefreshing/TR-Linux/issues
