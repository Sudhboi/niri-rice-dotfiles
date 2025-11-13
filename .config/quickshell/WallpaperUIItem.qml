import QtQuick 
import QtQuick.Layouts

Rectangle {

    required property string imageName; 
    required property color lineColor;
    required property int imageHeight;
    property int imageLeftMargin : 0;
    property int imageRightMargin : 0;

    anchors.fill: parent;
    //anchors.margins: 10;
    color: "transparent"
    clip: true

    ColumnLayout {
        spacing : 0;
        anchors.fill: parent;
        Image {
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            Layout.leftMargin: imageLeftMargin;
            Layout.rightMargin: imageRightMargin;
            Layout.bottomMargin: 10;
            Layout.topMargin: 10;
            source: "/home/sudhirk/Pictures/Wallpapers/" + imageName; 

            clip: true;
            fillMode: Image.PreserveAspectCrop;
            sourceSize.width: imageHeight * 1.6
            sourceSize.height: imageHeight
        }
        Rectangle {
            Layout.fillWidth: true;
            color : lineColor
            implicitHeight : 2
        }
    }


}
