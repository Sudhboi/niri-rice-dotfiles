import subprocess
import os
import time
import random

wallpaper_directory = "/home/sudhirk/Pictures/Wallpapers"
pictures = os.listdir(wallpaper_directory)
interval = 120

subprocess.run(["notify-send", "Wallpaper Manager Started!"])


def get_wallpaper(num, transition_type):
    return [
        "/home/sudhirk/clones/awww/target/release/awww",
        "img",
        wallpaper_directory + "/" + pictures[num],
        "--transition-type",
        transition_type,
        "--transition-step",
        "90",
        "--transition-fps",
        "120",
    ]


try:
    while (
        subprocess.run(
            get_wallpaper(random.randrange(len(pictures)), "none")
        ).returncode
        == 1
    ):
        subprocess.run(["notify-send", "Can't Find awww socket!"])

    time.sleep(interval)

    while True:
        num_pic = random.randrange(len(pictures))
        subprocess.run(get_wallpaper(num_pic, "center"))
        time.sleep(interval)
except Exception as e:
    subprocess.run(["notify-send", str(e)])
