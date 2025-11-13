import Quickshell
import Quickshell.Io

Scope {
    id: root
    property string wallpaperScriptsPath : "/home/sudhirk/.config/quickshell/pythonScripts/Wallpaper/"
    property int numWallpapers

    Process {
        running : true
        command : ["sh", "-c", "python " + wallpaperScriptsPath + "create_json.py"]
        stdout : StdioCollector {
            onStreamFinished : {
                numWallpapers = parseInt(`${this.text}`)
                console.info(numWallpapers)
            }
        }
    }

    Volume {}

    WallpaperManager {
        id: wallpaperManager 
        scriptsPath : wallpaperScriptsPath
    }

    WallpaperUIRemodel {
        id: wallpaperUI 
        wallpaperManager: wallpaperManager
        scriptsPath : wallpaperScriptsPath
        numWallpapers : 70
    }

    //WallpaperUIItemList {}

    //JSONFileHandler {}
    
}
