import get_image
import random
import sys

set_index = "0"

if sys.argv[1] == "random":
    rand_num = random.randrange(len(get_image.pictures))
    get_image.set_wallpaper(rand_num)
    set_index = str(rand_num)

elif sys.argv[1] == "number":
    get_image.set_wallpaper(int(sys.argv[2]))
    set_index = sys.argv[2]

elif sys.argv[1] == "name":
    get_image.set_wallpaper_with_name(sys.argv[2])
    set_index = str(get_image.pictures.index(sys.argv[2]))

elif sys.argv[1] == "boot":
    set_index = str(get_image.set_wallpaper_boot())

print(set_index)
