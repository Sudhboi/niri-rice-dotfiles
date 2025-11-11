import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Scope {
    required property string scriptsPath

    required property WallpaperManager wallpaperManager

    id: root

    LazyLoader {
        id: uiLoader;
        active: false;

        PanelWindow {
            anchors.bottom: true;
            margins.bottom: 15;
            focusable: true;

            implicitHeight: 200;
            implicitWidth: 320;
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
                    wallpaperManager.currentImageIndex = view.currentIndex;
                    wallpaperManager.setWallpaperWithIndex.running = true;
                    uiLoader.active = false;
                    wallpaperManager.periodicWallpaperTimer.restart();
                    notifyManualChange.running = true;
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
        id: notifyManualChange
        command: ["notify-send", "Set Wallpaper to Index " + wallpaperManager.currentImageIndex];
        running: false
    }

}
