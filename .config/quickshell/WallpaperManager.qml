import Quickshell
import Quickshell.Io
import QtQuick


Scope {
    property string scriptsPath: "/home/sudhirk/.config/quickshell/pythonScripts/Wallpaper/";

    id: root;

    Process {
        id: setWallpaperBoot;

        running: true;
        command: ["sh", "-c", "python " + scriptsPath + "set_wallpaper_boot.py"];
    }

    Process {
        id: setWallpaperPeriodic;

        running: false;
        command: ["sh", "-c", "python " + scriptsPath + "set_wallpaper.py random"];
    }

    Process {
        id: setWallpaperWithName;

        running: false;
        command: ["sh", "-c", "python " + scriptsPath + "set_wallpaper.py name " + currentImage];
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

        function extendWallpaper() : void {
            periodicWallpaperTimer.restart();
        }

        function setWallpaper() : void {
            setWallpaperWithName.running = true;
            periodicWallpaperTimer.restart()
        }
    }

}
