 local menu98edb85b00d9527ad5acebe451b3fae6 = {
     {"Application Finder", "xfce4-appfinder"},
     {"Code - OSS", "/usr/bin/code-oss --no-sandbox --unity-launch ", "/usr/share/pixmaps/code-oss.png" },
     {"Files", "nautilus --new-window "},
     {"Font Manager", "font-manager "},
     {"Font Viewer", "/usr/libexec/font-manager/font-viewer "},
     {"Notepadqq", "notepadqq ", "/usr/share/icons/hicolor/16x16/apps/notepadqq.png" },
     {"compton", "compton", "/usr/share/icons/hicolor/48x48/apps/compton.png" },
     {"nitrogen", "nitrogen", "/usr/share/icons/hicolor/16x16/apps/nitrogen.png" },
     {"picom", "picom"},
 }

 local menude7a22a0c94aa64ba2449e520aa20c99 = {
     {"LibreOffice Math", "libreoffice --math ", "/usr/share/icons/hicolor/16x16/apps/libreoffice-math.png" },
 }

 local menud334dfcea59127bedfcdbe0a3ee7f494 = {
     {"Document Viewer", "evince "},
     {"LibreOffice Draw", "libreoffice --draw ", "/usr/share/icons/hicolor/16x16/apps/libreoffice-draw.png" },
     {"Ristretto Image Viewer", "ristretto ", "/usr/share/icons/hicolor/16x16/apps/ristretto.png" },
 }

 local menuc8205c7636e728d448c2774e6a4a944b = {
     {"Avahi SSH Server Browser", "/usr/bin/bssh"},
     {"Avahi VNC Server Browser", "/usr/bin/bvnc"},
     {"Chromium", "/usr/bin/chromium ", "/usr/share/icons/hicolor/16x16/apps/chromium.png" },
     {"Firefox", "/usr/lib/firefox/firefox ", "/usr/share/icons/hicolor/16x16/apps/firefox.png" },
     {"Microsoft Teams - Preview", "/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=teams --file-forwarding com.microsoft.Teams @@u  @@", "/var/lib/flatpak/exports/share/icons/hicolor/64x64/apps/com.microsoft.Teams.png" },
     {"Zoom", "/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=zoom --file-forwarding us.zoom.Zoom @@u  @@", "/var/lib/flatpak/exports/share/icons/hicolor/64x64/apps/us.zoom.Zoom.png" },
     {"qBittorrent", "qbittorrent ", "/usr/share/icons/hicolor/16x16/apps/qbittorrent.png" },
 }

 local menudf814135652a5a308fea15bff37ea284 = {
     {"Document Viewer", "evince "},
     {"LibreOffice", "libreoffice ", "/usr/share/icons/hicolor/16x16/apps/libreoffice-startcenter.png" },
     {"LibreOffice Base", "libreoffice --base ", "/usr/share/icons/hicolor/16x16/apps/libreoffice-base.png" },
     {"LibreOffice Calc", "libreoffice --calc ", "/usr/share/icons/hicolor/16x16/apps/libreoffice-calc.png" },
     {"LibreOffice Draw", "libreoffice --draw ", "/usr/share/icons/hicolor/16x16/apps/libreoffice-draw.png" },
     {"LibreOffice Impress", "libreoffice --impress ", "/usr/share/icons/hicolor/16x16/apps/libreoffice-impress.png" },
     {"LibreOffice Math", "libreoffice --math ", "/usr/share/icons/hicolor/16x16/apps/libreoffice-math.png" },
     {"LibreOffice Writer", "libreoffice --writer ", "/usr/share/icons/hicolor/16x16/apps/libreoffice-writer.png" },
 }

 local menue6f43c40ab1c07cd29e4e83e4ef6bf85 = {
     {"Apache NetBeans", "netbeans ", "/usr/share/pixmaps/netbeans.png" },
     {"Arduino IDE", "arduino ", "/usr/share/icons/hicolor/16x16/apps/arduino.png" },
     {"Code - OSS", "/usr/bin/code-oss --no-sandbox --unity-launch ", "/usr/share/pixmaps/code-oss.png" },
     {"Electron", "electron7 ", "/usr/share/pixmaps/electron7.png" },
     {"Notepadqq", "notepadqq ", "/usr/share/icons/hicolor/16x16/apps/notepadqq.png" },
 }

 local menu52dd1c847264a75f400961bfb4d1c849 = {
     {"PulseAudio Volume Control", "pavucontrol"},
     {"Qt V4L2 test Utility", "qv4l2", "/usr/share/icons/hicolor/16x16/apps/qv4l2.png" },
     {"Qt V4L2 video capture utility", "qvidcap", "/usr/share/icons/hicolor/16x16/apps/qvidcap.png" },
     {"VLC media player", "/usr/bin/vlc --started-from-file ", "/usr/share/icons/hicolor/16x16/apps/vlc.png" },
 }

 local menuee69799670a33f75d45c57d1d1cd0ab3 = {
     {"Alacritty", "alacritty", "/usr/share/pixmaps/Alacritty.svg" },
     {"Avahi Zeroconf Browser", "/usr/bin/avahi-discover"},
     {"Bulk Rename", "/usr/lib/Thunar/ThunarBulkRename ", "/usr/share/icons/hicolor/16x16/apps/Thunar.png" },
     {"Htop", "xterm -e htop", "/usr/share/pixmaps/htop.png" },
     {"OpenJDK Java 14 Console", "/usr/lib/jvm/java-14-openjdk/bin/jconsole"},
     {"OpenJDK Java 14 Shell", "xterm -e /usr/lib/jvm/java-14-openjdk/bin/jshell"},
     {"Terminator", "terminator", "/usr/share/icons/hicolor/16x16/apps/terminator.png" },
     {"Thunar File Manager", "thunar ", "/usr/share/icons/hicolor/16x16/apps/Thunar.png" },
     {"Timeshift", "timeshift-launcher", "/usr/share/icons/hicolor/16x16/apps/timeshift.png" },
 }

xdgmenu = {
    {"Accessories", menu98edb85b00d9527ad5acebe451b3fae6},
    {"Education", menude7a22a0c94aa64ba2449e520aa20c99},
    {"Graphics", menud334dfcea59127bedfcdbe0a3ee7f494},
    {"Internet", menuc8205c7636e728d448c2774e6a4a944b},
    {"Office", menudf814135652a5a308fea15bff37ea284},
    {"Programming", menue6f43c40ab1c07cd29e4e83e4ef6bf85},
    {"Sound & Video", menu52dd1c847264a75f400961bfb4d1c849},
    {"System Tools", menuee69799670a33f75d45c57d1d1cd0ab3},
}

