import QtQuick 

Rectangle {

    required property string imageName; 

    anchors.fill: parent;
    anchors.margins: 10;
    focus: true;

    Image {
        anchors.fill: parent;
        source: "/home/sudhirk/Pictures/Wallpapers/" + imageName; 
        
        clip: true;
        fillMode: Image.PreserveAspectCrop;
        sourceSize.width: 460
        sourceSize.height: 280
    }

}
