import Quickshell
import Quickshell.Io
import QtQuick


Scope {
    property var scriptsPath: "/home/sudhirk/.config/quickshell/pythonScripts/Wallpaper/";
    id: root;

    Process {
        id: setWallpaperBoot;

        running: true;
        command: ["sh", "-c", "python " + scriptsPath + "set_wallpaper_boot.py"];
    }

    Process {
        id: setWallpaperPeriodic;

        running: false;
        command: ["sh", "-c", "python " + scriptsPath + "set_wallpaper.py -1"];
    }

    Timer {
        id: periodicWallpaperTimer;

        interval: 120000;
        running: true;
        repeat: true;

        onTriggered: setWallpaperPeriodic.running = true;
    }

    IpcHandler {
        target: "setWallpaperPeriodic"

        function nextWallpaper() : void {
            setWallpaperPeriodic.running = true;
            periodicWallpaperTimer.restart();
        }
    }
}
