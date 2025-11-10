import subprocess
import os
import time
import random
import sys

wallpaper_directory = "/home/sudhirk/Pictures/Wallpapers"
pictures = os.listdir(wallpaper_directory)
interval = 120
used_wallpapers = []

if len(sys.argv) >= 3:
    if sys.argv[2] == "debug":
        subprocess.run(
            [
                "notify-send",
                "Wallpaper Manager Started!"
                + (" (Boot Mode) " if sys.argv[1] == "boot" else ""),
            ]
        )


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
    if len(sys.argv) > 1 and sys.argv[1] == "boot":
        while (
            subprocess.run(
                get_wallpaper(random.randrange(len(pictures)), "none")
            ).returncode
            == 1
        ):
            subprocess.run(["notify-send", "Can't Find awww socket!"])

        time.sleep(interval)

    while True:
        if len(used_wallpapers) == len(pictures):
            used_wallpapers = []

        num_pic = random.randrange(len(pictures))

        while num_pic in used_wallpapers:
            num_pic = random.randrange(len(pictures))

        subprocess.run(get_wallpaper(num_pic, "any"))
        used_wallpapers.append(num_pic)

        time.sleep(interval)
except Exception as e:
    subprocess.run(["notify-send", str(e)])
