import get_image
import random
import sys

if sys.argv[1] == "random":
    get_image.set_wallpaper(random.randrange(len(get_image.pictures)))
elif sys.argv[1] == "number":
    get_image.set_wallpaper(int(sys.argv[2]))
elif sys.argv[1] == "name":
    get_image.set_wallpaper_with_name(sys.argv[2])
