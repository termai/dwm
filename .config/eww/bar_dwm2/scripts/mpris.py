#!/usr/bin/env python3
# juminai @ github

import dbus
import json
import gi
import subprocess

from gi.repository import GLib
from dbus.mainloop.glib import DBusGMainLoop


def get_player_property(player_interface, prop):
    try:
        return player_interface.Get("org.mpris.MediaPlayer2.Player", prop)
    except dbus.exceptions.DBusException:
        return None


def format_time(seconds):
    if seconds < 3600:
        minutes = seconds // 60
        remaining_seconds = seconds % 60
        return f"{minutes:02d}:{remaining_seconds:02d}"
    else:
        hours = seconds // 3600
        minutes = (seconds % 3600) // 60
        remaining_seconds = seconds % 60
        return f"{hours:02d}:{minutes:02d}:{remaining_seconds:02d}"
    

def clean_name(name):
    name = name.split(".instance")[0]
    name = name.replace("org.mpris.MediaPlayer2.", "")
    return name


def get_icon(name):
    player_name = clean_name(name)

    if player_name == "firefox":
        icon = ""
    elif player_name == "brave":
        icon = ""
    elif player_name == "spotify":
        icon = ""
    elif player_name == "cider":
        icon = ""
    elif player_name in ["chrome", "chromium"]:
        icon = ""
    else:
        icon = ""

    return icon
    
def mpris_data():
    session_bus = dbus.SessionBus()
    bus_names = session_bus.list_names()

    players = []

    for name in bus_names:
        if "org.mpris.MediaPlayer2." in name:
            player = session_bus.get_object(name, "/org/mpris/MediaPlayer2")
            player_interface = dbus.Interface(player, "org.freedesktop.DBus.Properties")
            metadata = get_player_property(player_interface, "Metadata")
            playback_status = get_player_property(player_interface, "PlaybackStatus")
            
            shuffle = bool(get_player_property(player_interface, "Shuffle"))
            loop_status = get_player_property(player_interface, "LoopStatus")
            can_go_next = bool(get_player_property(player_interface, "CanGoNext"))
            can_go_previous = bool(get_player_property(player_interface, "CanGoPrevious"))
            can_play = bool(get_player_property(player_interface, "CanPlay"))
            can_pause = bool(get_player_property(player_interface, "CanPause"))
            volume = get_player_property(player_interface, "Volume")
            length = metadata.get("mpris:length") 
            length = length // 1000000 if length is not None else -1
            position = get_player_property(player_interface, "Position")
            position = position // 1000000 if position is not None else -1
            artist = metadata.get("xesam:artist", ["Unknown"])

            player_data = {
                "name": clean_name(name),
                "title": metadata.get("xesam:title", "Unknown"),
                "artist": artist[0] if artist else None,
                "album": metadata.get("xesam:album", "Unknown"),
                "artUrl": metadata.get("mpris:artUrl", None),
                "status": playback_status,
                "length": length,
                "lengthStr": format_time(length) if length != -1 else -1,
                "loop": loop_status,
                "shuffle": shuffle,
                "volume": int(volume * 100) if volume is not None else -1,
                "canGoNext": can_go_next,
                "canGoPrevious": can_go_previous,
                "canPlay": can_play,
                "canPause": can_pause,
                "icon": get_icon(name),
            }

            players.append(player_data)

    return players


def properties_changed_listener():
    session_bus = dbus.SessionBus()
    session_bus.add_signal_receiver(
        properties_changed,
        dbus_interface="org.freedesktop.DBus",
        signal_name="NameOwnerChanged"
    )
    bus_names = session_bus.list_names()

    for name in bus_names:
        if "org.mpris.MediaPlayer2." in name:
            player = session_bus.get_object(name, "/org/mpris/MediaPlayer2")
            player_interface = dbus.Interface(player, "org.freedesktop.DBus.Properties")
            player_interface.connect_to_signal("PropertiesChanged", properties_changed)


def properties_changed(interface, changed_properties, invalidated_properties):
    subprocess.run([
       "eww", "update", f"mpris={json.dumps(mpris_data())}"
    ])


if __name__ == "__main__":
    DBusGMainLoop(set_as_default=True)
    loop = GLib.MainLoop()
    
    try:
        subprocess.run([
            "eww", "update", f"mpris={json.dumps(mpris_data())}"
        ])
        properties_changed_listener()
        loop.run()
    except KeyboardInterrupt:
        loop.quit()
