#!/usr/bin/env python3
import subprocess

def get_player_metadata():
    try:
        title = subprocess.check_output(["playerctl", "metadata", "title"], text=True).strip()
        artist = subprocess.check_output(["playerctl", "metadata", "artist"], text=True).strip()
        return title, artist
    except subprocess.CalledProcessError:
        return None, None

def find_music_file(title, artist):
    try:
        music_files = subprocess.check_output(["find", "/home/termai/Music/", "-type", "f"], text=True).splitlines()
        matching_files = [file for file in music_files if title in file and artist in file]
        return matching_files[0] if matching_files else None
    except subprocess.CalledProcessError:
        return None

def extract_album_art(music_file):
    if music_file:
        try:
            front_cover = "/tmp/FRONT_COVER.jpg"
            subprocess.run(["rm", front_cover])
            subprocess.run(["eyeD3", "--write-images=/tmp/", music_file])
            subprocess.run(["dunstify", "-i", "/tmp/FRONT_COVER.jpg", title, artist])
        except subprocess.CalledProcessError:
            pass

if __name__ == "__main__":
    while True:
        title, artist = get_player_metadata()
        if title and artist:
            music_file = find_music_file(title, artist)
            extract_album_art(music_file)
