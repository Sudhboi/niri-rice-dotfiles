import Quickshell
import Quickshell.Io

Scope {
    id: root
    property string wallpaperScriptsPath : "/home/sudhirk/.config/quickshell/pythonScripts/Wallpaper/"
    property int numWallpapers

    Volume {}

    WallpaperManager {
        id: wallpaperManager 
        scriptsPath : wallpaperScriptsPath
    }

    WallpaperUIRemodel {
        id: wallpaperUI 
        wallpaperManager: wallpaperManager
        scriptsPath : wallpaperScriptsPath
        numWallpapers : 52
    }

    //WallpaperUIItemList {}

    //JSONFileHandler {}
    
    Process {
        running : true
        command : ["sh", "-c", "python " + wallpaperScriptsPath + "create_json.py"]
        stdout : StdioCollector {
            onStreamFinished : {
                numWallpapers = parseInt(`${this.text}`)
            }
        }
    }
}
