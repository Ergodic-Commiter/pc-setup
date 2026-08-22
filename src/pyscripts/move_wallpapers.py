import argparse
from pathlib import Path
import shutil
import warnings as ww

ww.simplefilter('once')

SOURCE=Path("/usr/share/wallpapers")
TARGET=Path("~/Pictures/Wallpapers")


def move_wallpapers(dir_from:Path, dir_to:Path): 
    dir_to.mkdir(parents=True, exist_ok=True)

    for w_dir in dir_from.iterdir(): 
        if not w_dir.is_dir(): 
            ww.warn(f"Item {w_dir.name} is not a dir")
            continue        
        
        w_scn = find_screenshot(w_dir )

        w_dest = dir_to / w_dir.with_suffix('.png').name
        shutil.copy(w_jpg, w_dest)


def find_screenshot(name): 
        w_jpg = w_dir/"contents/screenshot.png"
        if not w_jpg.exists(): 
            ww.warn(f"Item {w_dir.name} has no contents/screenshot.png")
            continue


def parse_args():
    parser = argparse.ArgumentParser(
        description="Collect wallpaper screenshots into a flat folder.")
    parser.add_argument("--from", dest="dir_from", type=Path, default=SOURCE,
        help=f"Wallpapers source directory (default: {SOURCE})")
    parser.add_argument("--to", dest="dir_to", type=Path, default=TARGET,
        help=f"Destination directory (default: {TARGET})")
    return parser.parse_args()



if __name__ == '__main__': 
    args = parse_args()
    move_wallpapers(dir_from=args.dir_from.expanduser(), 
        dir_to=args.dir_to.expanduser())



