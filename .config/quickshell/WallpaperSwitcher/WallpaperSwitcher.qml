import QtQuick
import Quickshell
import Quickshell.Io

Scope {
    id: root

    //required ListModel wallpaperModel
    //required Component wallpaperDelegate
    required property JSONFileHandler jsonData

    PanelWindow {
        id: panelWindow

        anchors.bottom: true;
        margins.bottom: 15;
        focusable: true;

        implicitHeight: 200;
        implicitWidth: 320;

        exclusiveZone: 0;

        Rectangle {

            implicitWidth: parent.implicitWidth;
            implicitHeight: parent.implicitHeight;

            color: "#cc0d1117";

            ListModel {
                id: model

                ListElement { imageName: "pexels-pixabay-459203.jpg" }
                ListElement { imageName: "pexels-frans-van-heerden-201846-3025005.jpg"}
                ListElement { imageName: "os-x-mountain-lion-3840x2160-24075.jpg"}
            }

            //WallpaperUIItem { id : delegate }

            Component {
                id: delegate

                Rectangle {

                    width: view.width
                    height: view.height

                    Image {
                        anchors.fill: parent;
                        source: "/home/sudhirk/Pictures/Wallpapers/" + imageName; 

                        clip: true;
                        fillMode: Image.PreserveAspectCrop;
                        sourceSize.width: 460
                        sourceSize.height: 280
                    }

                }
            }

            PathView {
                id: view

                //anchors.fill: parent

                snapMode: PathView.SnapOneItem
                highlightRangeMode: PathView.StrictlyEnforceRange
                currentIndex: 0

                model: model
                delegate: delegate

                path: Path {
                    startX: -view.width / 2  // let the first item in left
                    startY: view.height / 2  // item's vertical center is the same as line's

                    PathLine {
                        relativeX: view.width * view.model.count  // all items in lines
                        relativeY: 0
                    }
                }
            }

            Rectangle {

                anchors.fill : parent

                Image {
                    anchors.fill: parent;
                    source: "/home/sudhirk/Pictures/Wallpapers/pexels-pixabay-459203.jpg"; 

                    clip: true;
                    fillMode: Image.PreserveAspectCrop;
                    sourceSize.width: 460
                    sourceSize.height: 280
                }

            }
        }
    }
}
