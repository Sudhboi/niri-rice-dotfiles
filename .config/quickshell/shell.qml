import Quickshell
import Quickshell.Io

Scope {
    id: root
    property string wallpaperScriptsPath : "/home/sudhirk/.config/quickshell/pythonScripts/Wallpaper/"

    Volume {}

    WallpaperManager {
        id: wallpaperManager 
        scriptsPath : wallpaperScriptsPath
    }

    WallpaperUI {
        id: wallpaperUI 
        wallpaperManager: wallpaperManager
        scriptsPath : wallpaperScriptsPath
    }
}
