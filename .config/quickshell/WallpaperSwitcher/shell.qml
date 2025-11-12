import Quickshell

Scope {
    id: root
    
    //PathViewExample {}

    JSONFileHandler { id : jsonData }

    WallpaperSwitcher {
        id : switcherUI
        jsonData : jsonData
    }
}
