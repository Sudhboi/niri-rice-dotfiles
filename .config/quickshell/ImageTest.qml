import QtQuick
import Quickshell
import Quickshell.Io

Scope {
    id: root;

    Process {
        id: bootWallpaperManager;

        running: true;
        command: ["sh", "-c", "python ~/.config/scripts/wallpaper_switcher.py boot" ]
    }

}
