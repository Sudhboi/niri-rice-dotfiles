import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Scope {
    required property string scriptsPath

    required property WallpaperManager wallpaperManager
    readonly property var jsonData : JSON.parse(jsonFile.text())
    required property int numWallpapers

    id: root

    Loader {

        PanelWindow {

            id: panelWindow;
            visible: false;

            anchors.bottom: true;
            margins.bottom: 15;
            focusable: true;

            implicitHeight: 200;
            implicitWidth: 320;
            color: "#cc0d1117";

            exclusiveZone: 0;

            SwipeView {

                id: swipeView
                anchors.fill: parent
                currentIndex: wallpaperManager.currentImageIndex
                focus: true

                Repeater {
                    model: numWallpapers;
                    Loader {
                        active: SwipeView.isCurrentItem || SwipeView.isNextItem || SwipeView.isPreviousItem
                        sourceComponent: WallpaperUIItem {
                            imageName: root.jsonData[index]
                        }
                        asynchronous: true
                    }
                }

                Keys.onReturnPressed: {
                    wallpaperManager.currentImageIndex = swipeView.currentIndex;
                    wallpaperManager.setWallpaperWithIndex.running = true;
                    wallpaperManager.periodicWallpaperTimer.restart();
                    //notifyManualChange.running = true;
                }

                Keys.onEscapePressed: {
                    panelWindow.visible = false;
                }

            }
        }
    }

    IpcHandler {
        target: "panelWindow";

        function toggleWallpaperSwitcher () : void {
            var currentItem = wallpaperManager.currentImageIndex
            //swipeView.setCurrentIndex(currentItem)
            panelWindow.visible = !panelWindow.visible;
        }
    }

    Process {
        id: notifyManualChange
        command: ["notify-send", "Set Wallpaper to Index " + wallpaperManager.currentImageIndex];
        running: false
    }

    FileView {
        id : jsonFile
        path: Qt.resolvedUrl("./pythonScripts/Wallpaper/pictures.json")
        blockLoading: true
    }

    function getName (index) {
        return root.jsonData[index]
    }

    function getItem (index) {
        var component = Qt.createComponent("WallpaperUIItem.qml");
        var item = component.createObject( null, {imageName:getName(index)});
        return item;
    }

}
