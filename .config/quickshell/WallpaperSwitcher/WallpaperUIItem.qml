import QtQuick 

Rectangle {

    anchors.fill: parent;
    anchors.margins: 10;

    Image {
        anchors.fill: parent;
        source: "/home/sudhirk/Pictures/Wallpapers/" + JSONFileHandler.getName(index); 

        clip: true;
        fillMode: Image.PreserveAspectCrop;
        sourceSize.width: 460
        sourceSize.height: 280
    }

}
