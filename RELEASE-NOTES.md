# TechRefreshing Linux 1.0 release notes

Release date: 1 September 2026

TechRefreshing Linux 1.0 is the first amd64 desktop release from
TechRefreshing. It combines Debian 13 Stable with KDE Plasma 6 and a
beginner-friendly desktop intended for everyday PCs.

## Final refresh

- Corrected Plymouth geometry so the monogram, wordmark and animated progress
  dots no longer overlap.
- Replaced unreliable dock pin serialization with explicit Dolphin, Firefox,
  Discover and TR Welcome launchers.
- Added a pre-display identity service so KDE System Information consistently
  reports TechRefreshing Linux 1.0 and uses the TR distributor logo.
- Added KInfoCenter's distributor override so Debian's separate version/logo
  defaults cannot replace the TR 1.0 identity on the About This System page.
- Restored Debian's tested Calamares module sequence and delegated final
  installed-system cleanup to the existing first-boot service.
- Refined the floating top panel with an ISO date beside the clock.
- Reduced the normal and record-failure GRUB menu delay from five to three
  seconds without disabling hardware or network initialization services.

## Highlights

- KDE Plasma 6 with a top system bar and centred floating application dock
- TechRefreshing Control Centre for updates, software, setup, personalisation,
  maintenance, support, legal information, and system details
- TR-branded first-run experience in place of KDE Welcome
- TechRefreshing Live User (`trlinux`) live-session identity
- TR distributor logo and TechRefreshing Linux 1.0 system identity
- Top-bar session control for lock, log out, restart, and shutdown
- Screen-fit Calamares window with unrestricted user-password acceptance
- Consistent installed-system TR identity, user avatar, and live-only cleanup
- Graphical TechRefreshing GRUB theme applied before the first installed boot
- Lightweight animated Plymouth splash with encryption-password support
- Curated Modern, Familiar, Classic, and Lightweight desktop profiles
- Hardware readiness, privacy-filtered diagnostics, package repair, boot repair,
  and support-report tools in the TechRefreshing Control Centre
- Wayland session with X11 components available for compatibility
- Calamares graphical installer
- APT and Flatpak with Flathub configured
- Firefox ESR, LibreOffice, VLC, GIMP, Thunderbird, and KDE utilities
- NetworkManager, firmware support, KDE Connect, and Discover
- TR Linux welcome and information application
- TechRefreshing boot, Plymouth, login, installer, icon, and wallpaper assets
- no mandatory TechRefreshing telemetry

## Installation

Verify the ISO checksum, boot the live environment, test networking, sound,
graphics, and storage visibility, then launch "Install TechRefreshing Linux".
Back up existing data before partitioning.

## Support

See SUPPORT.md and KNOWN-ISSUES.md.
