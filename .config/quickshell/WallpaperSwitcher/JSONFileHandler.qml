import Quickshell
import Quickshell.Io
import QtQuick

Scope {

    id: root

    FileView {
        id : jsonFile
        path: Qt.resolvedUrl("pictures.json")
        blockLoading: true
    }

    function getName (index) {
        return eval("JSON.parse(jsonFile.text())[" + index + "]")
    }

    function getItem (index) {
        var component = Qt.createComponent("WallpaperUIItem.qml");
        var item = component.createObject( null, {imageName:getName(index)});
        return item;
    }

}
