import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Scope {
    property string scriptsPath: "/home/sudhirk/.config/quickshell/pythonScripts/Wallpaper/";
    property var currentImage

    id: root

    LazyLoader {
        id: uiLoader;
        active: false;

        PanelWindow {
            anchors.bottom: true;
            margins.bottom: 15;
            focusable: true;

            implicitHeight: 300;
            implicitWidth: 480;
            color: "#cc0d1117";

            exclusiveZone: 0;

            SwipeView {
                id: view
                anchors.fill: parent
                currentIndex: 1
                focus: true

                Item {
                    WallpaperUIItem {imageName: "pexels-pixabay-459203.jpg" }
                }
                Item {
                    WallpaperUIItem {imageName: "pexels-frans-van-heerden-201846-3025005.jpg" }
                }
                Item {
                    WallpaperUIItem {imageName: "os-x-mountain-lion-3840x2160-24075.jpg" }
                }

                Keys.onReturnPressed: {
                    currentImage = view.currentIndex;
                    changeWallpaper.running = true;
                }
            }
        }
    }

    IpcHandler {
        target: "uiLoader";

        function toggleWallpaperSwitcher () : void {
            uiLoader.active = !uiLoader.active;
        }
    }

    Process {
        id: test
        command: ["notify-send", currentImage];
        running: false
    }

    Process {
        id: changeWallpaper
        command: ["sh", "-c", "python " + scriptsPath + "set_wallpaper.py number " + currentImage];
        running: false
    }
}
