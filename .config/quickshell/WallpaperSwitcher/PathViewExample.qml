
// Source - https://stackoverflow.com/a
// Posted by Dawny, modified by community. See post 'Timeline' for change history
// Retrieved 2025-11-11, License - CC BY-SA 4.0
import QtQuick
import Quickshell

PanelWindow {

    anchors.bottom: true;
    margins.bottom: 15;
    focusable: true;

    implicitHeight: 200;
    implicitWidth: 320;
    color: "#cc0d1117";

    exclusiveZone: 0;

    Rectangle {
        width: parent.width
        height: parent.height

        ListModel {
            id: model
            ListElement { color: "red"   }
            ListElement { color: "green" }
            ListElement { color: "blue"  }
        }

        Component {
            id: delegate
            Rectangle {
                id: wrapper
                width: view.width
                height: view.height
                color: model.color

                Text {
                    anchors.centerIn: parent
                    font.pointSize: 26
                    font.bold: true
                    color: "white"
                    text: index
                }
            }
        }

        PathView {
            id: view

            anchors.fill: parent

            snapMode: PathView.SnapOneItem
            highlightRangeMode: PathView.StrictlyEnforceRange
            currentIndex: -1

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
    }
}

