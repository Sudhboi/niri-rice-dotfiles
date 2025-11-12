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
    property var colorArray : ["#fffb4934", "#ffb8bb26", "#fffabd2f", "#ffd65d0e", "#ff83a598", "#ffd3869b", "#ff8ec07c"]

    id: root

    Loader {

        PanelWindow {

            id: panelWindow;
            visible: false;

            anchors.bottom: true;
            margins.bottom: 15;
            focusable: true;

            implicitHeight: 200;
            implicitWidth: 240 + 320 + 240;
            color: "transparent";

            exclusiveZone: 0;

            RowLayout {
                spacing : 0;
                anchors.fill: parent

                Rectangle {
                    Layout.preferredHeight: 150
                    Layout.preferredWidth: 240
                    Layout.alignment: Qt.AlignBottom
                    color: "#cc0d1117"
                    clip: true
                    SwipeView {

                        id: leftView
                        anchors.fill : parent
                        currentIndex : swipeView.currentIndex - 1
                        focus : false
                        interactive : false

                        Repeater {
                            model: numWallpapers;
                            Loader {
                                active: SwipeView.isCurrentItem || SwipeView.isNextItem || SwipeView.isPreviousItem
                                sourceComponent: WallpaperUIItem {
                                    imageName: root.jsonData[index]
                                    lineColor : root.colorArray[index % root.colorArray.length]
                                    imageHeight: 150
                                }
                                asynchronous : true
                            }
                        }

                    }
                }

                Rectangle {

                    Layout.preferredWidth: 320
                    Layout.fillHeight: true
                    color : "#cc0d1117"
                    clip:true

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
                                    lineColor: root.colorArray[index % root.colorArray.length]
                                    imageHeight: 200
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

                Rectangle {
                    Layout.preferredHeight: 150
                    Layout.preferredWidth: 240
                    Layout.alignment: Qt.AlignBottom
                    color: "#cc0d1117"
                    clip: true
                    SwipeView {

                        id: rightView
                        anchors.fill : parent
                        currentIndex : swipeView.currentIndex + 1
                        focus : false
                        interactive : false

                        Repeater {
                            model: numWallpapers;
                            Loader {
                                active: SwipeView.isCurrentItem || SwipeView.isNextItem || SwipeView.isPreviousItem
                                sourceComponent: WallpaperUIItem {
                                    imageName: root.jsonData[index]
                                    lineColor : root.colorArray[index % root.colorArray.length]
                                    imageHeight: 150
                                }
                                asynchronous : true
                            }
                        }

                    }
                }

            }
        }
    }

    IpcHandler {
        target: "panelWindow";

        function toggleWallpaperSwitcher () : void {
            panelWindow.visible = !panelWindow.visible;
            swipeView.decrementCurrentIndex();
            swipeView.incrementCurrentIndex();
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
