// Copyright © 2026 TechRefreshing
// SPDX-License-Identifier: GPL-3.0-only
var old = panels(); for (var i = old.length - 1; i >= 0; --i) old[i].remove();
var panel = new Panel(); panel.location = "top"; panel.height = 34; panel.hiding = "none";
var menu = panel.addWidget("org.kde.plasma.kickoff"); menu.currentConfigGroup = ["General"]; menu.writeConfig("icon", "tr-linux");
panel.addWidget("org.kde.plasma.pager"); panel.addWidget("org.kde.plasma.taskmanager"); panel.addWidget("org.kde.plasma.systemtray"); panel.addWidget("org.kde.plasma.digitalclock");
