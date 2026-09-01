// Copyright © 2026 TechRefreshing
// SPDX-License-Identifier: GPL-3.0-only
// TechRefreshing Linux Plasma 6 first-login layout.
// A slim top status panel and a centred floating bottom dock provide the
// requested familiar macOS-style structure while remaining native Plasma.

var existing = panels();
for (var i = existing.length - 1; i >= 0; --i) {
    existing[i].remove();
}

var topPanel = new Panel();
topPanel.location = "top";
topPanel.height = 30;
topPanel.hiding = "none";

var appMenu = topPanel.addWidget("org.kde.plasma.appmenu");
topPanel.addWidget("org.kde.plasma.panelspacer");
topPanel.addWidget("org.kde.plasma.systemtray");
topPanel.addWidget("org.kde.plasma.digitalclock");
// Dedicated session control for lock, log out, restart and shutdown. This is
// separate from the battery entry inside the system tray.
topPanel.addWidget("org.kde.plasma.lock_logout");

var dock = new Panel();
dock.location = "bottom";
dock.height = 58;
dock.hiding = "windowscover";
// Plasma 6 uses fill=false plus lengthMode for a content-sized centred panel.
dock.alignment = "center";
dock.floating = true;
dock.lengthMode = "fit";

try {
    dock.writeConfig("floating", "1");
    dock.writeConfig("alignment", "center");
    dock.writeConfig("lengthMode", "fit");
    dock.writeConfig("minLength", "420");
    dock.writeConfig("maxLength", "760");
} catch (error) {
    // Older Plasma scripting APIs safely ignore the optional dock geometry.
}

var launcher = dock.addWidget("org.kde.plasma.kickoff");
launcher.currentConfigGroup = ["General"];
launcher.writeConfig("icon", "tr-linux");

var tasks = dock.addWidget("org.kde.plasma.icontasks");
tasks.currentConfigGroup = ["General"];
tasks.writeConfig(
    "launchers",
    "applications:org.kde.dolphin.desktop," +
    "applications:firefox-esr.desktop," +
    "applications:org.kde.discover.desktop," +
    "applications:systemsettings.desktop"
);

dock.addWidget("org.kde.plasma.showdesktop");

var desktops = desktopsForActivity(currentActivity());
for (var d = 0; d < desktops.length; ++d) {
    desktops[d].wallpaperPlugin = "org.kde.image";
    desktops[d].currentConfigGroup = ["Wallpaper", "org.kde.image", "General"];
    desktops[d].writeConfig(
        "Image",
        "file:///usr/share/tr-linux/branding/wallpaper-3840x2160.png"
    );
    desktops[d].writeConfig("FillMode", "2");
}
