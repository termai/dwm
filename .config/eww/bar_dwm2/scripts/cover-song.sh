#!/bin/bash

# Function to extract album art and delete FRONT_COVER.jpg
process_album_art() {
    # Get the currently playing song's title
    current_title=$(playerctl metadata title)

    # Find the music file that matches the current song title
    #music_file=$(find ~/Music/ -type f -print0 | awk -v title="$(playerctl metadata title).mp3" -F '\0' -v RS='\0' '$0 ~ title' | grep "$(playerctl metadata artist)")
    #music_file=$(ls -R ~/Music/ | grep "$(playerctl metadata title)" | grep "$(playerctl metadata artist)")
    #music_file=$(find ~/Music/ -type f -name "$(ls -R ~/Music/ | grep "$(playerctl metadata title)" | grep "$(playerctl metadata artist)")")
    music_file=$(cmus-remote -Q | grep 'file' | sed 's/^file //')
    current_player=$(playerctl metadata | awk 'FNR == 1 {print $1}')
    # Check if a matching music file was found
    #if [ -n "$music_file" ]; then
    if [ "$current_player" == "cmus" ]; then
        # Extract album art to /tmp/ using eyeD3
        #rm -rf /tmp/FRONT_COVER_*.jpg
        #eyeD3 --write-images=/tmp/ "$music_file"
        ffmpeg -i "$music_file" -y -an -vcodec copy /tmp/cover.jpg
        ffmpeg -i "$music_file" -y -an -vcodec copy /tmp/cover.jpg
        dunstify -i /tmp/cover.jpg "$(playerctl metadata title)" "$(playerctl metadata artist)"
        # Delete FRONT_COVER.jpg if it exists in the temporary directory
        #front_cover="/tmp/FRONT_COVER.jpg"
        #if [ -f "$front_cover" ]; then
            #rm "$front_cover"
        #fi
        
    elif [ "$current_player" == "brave"  ]; then
        cp /usr/share/icons/Papirus/64x64/apps/brave.svg /tmp/icon.svg
        cp /tmp/icon.svg /tmp/cover.jpg
        dunstify -i /tmp/cover.jpg "$(playerctl metadata title)" "$(playerctl metadata artist)"
  
    elif [ "$current_player" == "edge"  ]; then
        cp /usr/share/icons/Papirus/64x64/apps/microsoft-edge.svg /tmp/icon.svg
        cp /tmp/icon.svg /tmp/cover.jpg
        dunstify -i /tmp/cover.jpg "$(playerctl metadata title)" "$(playerctl metadata artist)"

    elif [ "$current_player" == "firefox"  ]; then
        vasta=$(find /home/termai/.mozilla/firefox/firefox-mpris/ -type f)
        cp "$vasta" /tmp/icon.svg
        cp "$vasta" /tmp/cover.jpg
        dunstify -i /tmp/cover.jpg "$(playerctl metadata title)" "$(playerctl metadata artist)"
    
    elif [ "$current_player" == "mpv"  ]; then
      newat=$(ffmpeg -ss 00:00:42 -i "$(playerctl metadata xesam:url | sed -e 's#file:///home/termai#/home/termai#g; s/%20/ /g')" -frames:v 1 -q:v 2 /home/termai/output.jpg -y)
      vasta=$(find ~/output.jpg)
        cp "$vasta" /tmp/icon.svg
        cp "$vasta" /tmp/cover.jpg
        dunstify -i /tmp/cover.jpg "$(playerctl metadata title | awk '{print $3}')" "$(playerctl metadata artist)"
    fi
}

# Monitor for song changes using playerctl
playerctl --follow metadata | while read -r; do
    process_album_art
done
#rm -rf /tmp/FRONT_COVER_*.jpg
