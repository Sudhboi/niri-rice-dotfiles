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
    while (
        subprocess.run(
            get_command(get_image(random.randrange(len(pictures))), "none")
        ).returncode
        == 1
    ):
        pass


def set_wallpaper(num):
    subprocess.run(get_command(get_image(num), "any"))
