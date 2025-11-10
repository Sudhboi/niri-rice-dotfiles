import get_image
import random
import sys

if sys.argv[1] == "-1":
    get_image.set_wallpaper(random.randrange(len(get_image.pictures)))
else:
    get_image.set_wallpaper(int(sys.argv[1]))
