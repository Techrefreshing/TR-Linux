// Copyright © 2026 TechRefreshing
// SPDX-License-Identifier: GPL-3.0-only
var old = panels(); for (var i = old.length - 1; i >= 0; --i) old[i].remove();
var panel = new Panel(); panel.location = "bottom"; panel.height = 48; panel.hiding = "none";
var menu = panel.addWidget("org.kde.plasma.kickoff"); menu.currentConfigGroup = ["General"]; menu.writeConfig("icon", "tr-linux");
var tasks = panel.addWidget("org.kde.plasma.icontasks"); tasks.currentConfigGroup = ["General"];
tasks.writeConfig("launchers", "applications:org.kde.dolphin.desktop,applications:firefox-esr.desktop,applications:org.kde.discover.desktop,applications:tr-linux-welcome.desktop");
panel.addWidget("org.kde.plasma.panelspacer"); panel.addWidget("org.kde.plasma.systemtray"); panel.addWidget("org.kde.plasma.digitalclock"); panel.addWidget("org.kde.plasma.showdesktop");
