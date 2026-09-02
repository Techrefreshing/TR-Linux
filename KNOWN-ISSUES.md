# Known issues

This document covers TechRefreshing Linux 1.0. Check GitHub for newer reports.

- The ISO is currently built for 64-bit x86 (amd64) PCs only.
- NVIDIA and other proprietary graphics drivers are not preinstalled. Some
  systems may need safe graphics mode for the live session.
- Secure Boot behaviour depends on firmware, boot mode, and the Debian-signed
  boot chain. Test the target hardware before changing existing installations.
- The live session is not persistent unless the USB was separately configured
  for persistence.
- The Debian Live fallback credentials are username `trlinux` and password
  `live`. Automatic login is enabled and the live session is configured not
  to lock during installation.
- Updates performed in the live session are temporary and disappear after
  reboot unless persistence is configured. Install before routine updating.
- Dock dimensions can vary slightly with display scaling and translated widget
  labels; the layout constrains it to a centred fit-content range.
- The installer accepts weak passwords when explicitly entered. Simple
  passwords materially reduce account security and are not recommended.
- Displays below 1024x600 may still require maximising the installer.
- The graphical GRUB and Plymouth experience depends on firmware graphics
  support. Unsupported modes fall back to GRUB/Plymouth text output.
- Boot duration depends on firmware, storage speed, graphics drivers and
  virtual-machine resources. TR Linux shortens the boot-menu delay but does not
  disable compatibility services merely to improve benchmark times.
- Restore points and filesystem snapshots are not enabled automatically in
  1.0; back up important data before system or partition changes.
- Some Wi-Fi, Bluetooth, fingerprint, webcam, or audio devices may require
  newer firmware or kernels than Debian Stable provides.
- Flatpak applications consume additional disk space after installation.
- Dual-boot installation can be affected by Windows Fast Startup, BitLocker,
  existing RAID, or unusual partition layouts. Back up recovery keys and data.

Report reproducible TR Linux-specific issues at:
https://github.com/Techrefreshing/TR-Linux/issues
