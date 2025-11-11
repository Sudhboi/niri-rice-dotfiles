import random
import os
import subprocess

wallpaper_directory = "/home/sudhirk/Pictures/Wallpapers"
pictures = os.listdir(wallpaper_directory)


def get_image(num):
    return pictures[num]


def get_command(image, transition_type):
    return [
        "/home/sudhirk/clones/awww/target/release/awww",
        "img",
        wallpaper_directory + "/" + image,
        "--transition-type",
        transition_type,
        "--transition-step",
        "90",
        "--transition-fps",
        "120",
    ]


def set_wallpaper_boot():
    rand_num = random.randrange(len(pictures))
    return_code = 1
    while return_code == 1:
        return_code = subprocess.run(
            get_command(get_image(rand_num), "none")
        ).returncode
    return rand_num


def set_wallpaper(num):
    subprocess.run(get_command(get_image(num), "any"))


def set_wallpaper_with_name(name):
    subprocess.run(get_command(name, "any"))
