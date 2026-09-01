# Release checklist

The release owner must complete and record every applicable item before
marking an image stable.

## Build and integrity

- [ ] Clean Debian 13 amd64 build completes
- [ ] ISO SHA-256 checksum validates
- [ ] Extracted filesystem validation passes
- [ ] Package manifest is preserved
- [ ] ISO filename, version, volume label, and release notes agree

## Boot testing

- [ ] VirtualBox UEFI boot
- [ ] VirtualBox legacy BIOS boot
- [ ] Physical UEFI PC boot
- [ ] Physical legacy BIOS PC boot where supported
- [ ] Secure Boot test
- [ ] Safe graphics menu test

## Live desktop

- [ ] No Debian wallpaper flash
- [ ] TR wallpaper appears before the desktop becomes interactive
- [ ] TR launcher icon is visible
- [ ] Top panel and bottom dock appear at 100%, 125%, and 150% scaling
- [ ] Welcome application opens and all local pages work
- [ ] Network, audio, Bluetooth, suspend, shutdown, and reboot tested

## Installer

- [ ] Welcome image fits at 1024×768 and 1280×800
- [ ] Installation slideshow is not clipped
- [ ] Automatic partition installation
- [ ] Manual partition installation
- [ ] EFI bootloader installation
- [ ] Legacy BIOS bootloader installation
- [ ] Encryption installation where supported
- [ ] Installed system boots without the live installer shortcut

## Installed system

- [ ] OS identity and About page are correct
- [ ] Creator and website links are correct
- [ ] SDDM, Plymouth, wallpaper, panels, and launcher remain branded
- [ ] APT update and Flatpak update work
- [ ] Firefox, LibreOffice, VLC, Discover, and Dolphin launch
- [ ] Legal notices and package licences are accessible
- [ ] No live-user sudo rule remains active for an installed account

## Publication

- [ ] Release notes and known issues reviewed
- [ ] Download checksum published
- [ ] Source availability and written offer published
- [ ] Privacy, trademark, disclaimer, and security documents reviewed
- [ ] At least one installation tested on old and modern hardware
- [ ] Final release approved by TechRefreshing
