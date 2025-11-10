import Quickshell
import Quickshell.Io
import QtQuick

Scope {
    id: root;

    Process {
        id: setWallpaperBoot;

        running: true;
        command: ["sh", "-c", "python /home/sudhirk/.config/quickshell/pythonScripts/Wallpaper/set_wallpaper_boot.py"];
    }

    Process {
        id: setWallpaperPeriodic;

        running: false;
        command: ["sh", "-c", "python /home/sudhirk/.config/quickshell/pythonScripts/Wallpaper/set_wallpaper.py -1"];
    }

    Timer {
        id: periodicWallpaperTimer;

        interval: 120000;
        running: true;
        repeat: true;

        onTriggered: setWallpaperPeriodic.running = true;
    }
}
