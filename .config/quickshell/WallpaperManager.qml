import Quickshell
import Quickshell.Io
import QtQuick


Scope {
    id: root;

    required property string scriptsPath

    property Timer periodicWallpaperTimer : periodicWallpaperTimer
    property var currentImageIndex : "0"
    property Process setWallpaperWithIndex: setWallpaperWithIndex

    Process {
        id: setWallpaperBoot;

        running: true;
        command: ["sh", "-c", "python " + scriptsPath + "set_wallpaper.py boot"];
        stdout: basicCollector
    }

    Process {
        id: setWallpaperPeriodic;

        running: false;
        command: ["sh", "-c", "python " + scriptsPath + "set_wallpaper.py random"];
        stdout: basicCollector
    }

    Process {
        id: setWallpaperWithIndex;

        running: false;
        command: ["sh", "-c", "python " + scriptsPath + "set_wallpaper.py number " + currentImageIndex];
        stdout: basicCollector
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

    StdioCollector {
        id: basicCollector
        onStreamFinished: {
            currentImageIndex = `${this.text}`;
            console.info(currentImageIndex);
        }
    }

}
